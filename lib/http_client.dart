import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class HttpClientRoute extends StatefulWidget {
  const HttpClientRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HttpClientRouteState();
}

class _HttpClientRouteState extends State<HttpClientRoute> {
  bool _loading = false;
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: _loading ? null : request, child: Text("获取百度首页")),
            Container(
              width: MediaQuery.of(context).size.width - 50.0,
              child: Text(_text.replaceAll(RegExp(r"\s"), "")),
            )
          ],
        ),
      ),
    );
  }

  request() async {
    setState(() {
      _loading = true;
      _text = "正在请求";
    });

    try {
      // 创建一个 HttpClient
      HttpClient httpClient = HttpClient();
      HttpClientRequest request =
          await httpClient.getUrl(Uri.parse("https://www.baidu.com"));
      HttpClientResponse response = await request.close();

      httpClient.findProxy = (uri) {
        // 如果需要通过过滤 uri, 可以手动判断
        return "PROXY 192.168.1.2:8888";
      };
      _text = await response.transform(utf8.decoder).join();
      // 打印响应头
      print(response.headers);

      // 文件中读取的内容
      String PEM = "xxx";
      httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) {
        if (cert.pem == PEM) {
          // 如果给的证书pem 和本地保存的PEM证书一致，则允许数据发送
          return true;
        }
        return false;
      };

      SecurityContext sc = SecurityContext();
      // file 为证书链
      HttpClient httpClient1 = HttpClient(context: sc);


      // 关闭 client 后， 通过该 client 发起的所有请求都会中止
      httpClient.close();
    } catch (e) {
      _text = "请求失败：$e";
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }
}
