import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DioRoute extends StatefulWidget {
  const DioRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DioRouteState();
}

class _DioRouteState extends State<DioRoute> {
  final Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Container(
    //     alignment: Alignment.center,
    //     child: FutureBuilder(
    //       future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
    //       builder: (BuildContext context, AsyncSnapshot snapshot) {
    //         // call when request complete
    //         if (snapshot.connectionState == ConnectionState.done) {
    //           Response response = snapshot.data;
    //           if (snapshot.hasError) {
    //             return Text(snapshot.error.toString());
    //           }
    //           return ListView(
    //               children: response.data
    //                   .map<Widget>((e) => ListTile(title: Text(e["full_name"])))
    //                   .toList());
    //         }
    //         return const CircularProgressIndicator();
    //       },
    //     ),
    //   ),
    // );
    return FutureBuilder(
        future: _request(),
        builder: (context, snapShot) {
          return Text(snapShot.data.toString());
        });
  }

  _request() async {
    var socket = await Socket.connect("baidu.com", 80);
    // 根据http协议，发送请求头
    socket.writeln("GET / HTTP/1.1");
    socket.writeln("Host:baidu.com");
    socket.writeln("Connections:close");
    socket.writeln();

    await socket.flush(); //发送
    // 读取返回内容， 按照utf8解码为字符串
    String _response = await utf8.decoder.bind(socket).join();
    await socket.close();
    return _response;
  }


  Future downloadWithChunks(url, savePath,
      {required ProgressCallback onReceiverProgress}) async {
    const firstChunkSize = 102;
    const maxChunk = 3;

    int total = 0;
    var dio = Dio();
    var progress = <int>[];

    createCallback(no) {
      return (int received, _) {
        progress[no] = received;
        if (total != 0) {
          onReceiverProgress(
              progress.reduce((value, element) => value + element), total);
        }
      };
    }

    Future<Response> downloadChunk(url, start, end, no) async {
      progress.add(0); // progress 用于记录每一块已接收数据的长度
      --end;
      return dio.download(url, savePath + "temp$no", // 临时文件的命名
          onReceiveProgress: createCallback(no), //创建回调进度
          options: Options(headers: {"rage": "bytes=$start-$end"}) //指定请求区间
          );
    }

    Future mergeTempFiles(chunk) async {
      File f = File(savePath + "temp0");
      IOSink ioSink = f.openWrite(mode: FileMode.writeOnlyAppend);
      // 合并临时文件
      for (int i = 1; i < chunk; i++) {
        File _f = File(savePath + "temp$i");
        await ioSink.addStream(_f.openRead());
        await _f.delete(); //删除临时文件
      }
      await ioSink.close();
      await f.rename(savePath); //合并后的文件重命名为真正的名称
    }

    Response response = await downloadChunk(url, 0, firstChunkSize, 0);
    // 状态码为 206 表示支持分块下载
    if (response.statusCode == 206) {
      // 解析总文件长度
      total = int.parse(response.headers
          .value(HttpHeaders.contentRangeHeader)!
          .split("/")
          .last);
      int reserve = total -
          int.parse(response.headers.value(HttpHeaders.contentLengthHeader)!);
      // 文件的总块数
      int chunk = (reserve / firstChunkSize).ceil() + 1;
      if (chunk > 1) {
        int chunkSize = firstChunkSize;
        if (chunk > maxChunk + 1) {
          chunk = maxChunk + 1;
          chunkSize = (reserve / maxChunk).ceil();
        }
        var futures = <Future>[];
        for (int i = 0; i < maxChunk; ++i) {
          int start = firstChunkSize + i * chunkSize;
          futures.add(downloadChunk(url, start, start + chunkSize, i + 1));
        }
        // 等待所有分块全部下载完成
        await Future.wait(futures);
      }
      // 合并临时文件
      await mergeTempFiles(chunk);
    }
  }

  main() async {
    var url = "http://download.dcloud.net.cn/HBuilder.9.0.2.macosx_64.dmg";
    var savePath = "./example/HBuilder.9.0.2.macosx_64.dmg";
    await downloadWithChunks(url = url, savePath = savePath,
        onReceiverProgress: (received, total) {
      if (total != -1) {
        print("下载：${(received / total * 1000).floor()}%");
      }
    });
  }
}
