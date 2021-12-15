import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollNotificationRoute extends StatefulWidget {
  const ScrollNotificationRoute({Key? key}) : super(key: key);

  @override
  State<ScrollNotificationRoute> createState() =>
      _ScrollNotificationRouteState();
}

class _ScrollNotificationRouteState extends State<ScrollNotificationRoute> {
  // 保存进度百分比
  String _progress = "0%";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scrollbar(
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              double progress = notification.metrics.pixels /
                  notification.metrics.maxScrollExtent;
              // 重新构建
              setState(() {
                _progress = "${(progress * 100).toInt()}%";
              });
              print("BottomEdge:${notification.metrics.extentAfter == 0}");
              return false;
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                ListView.builder(
                    itemBuilder: (context, index) =>
                        ListTile(title: Text("$index")),
                    itemCount: 100,
                    itemExtent: 45),
                CircleAvatar(
                  // 显示进度百分比
                  radius: 30.0,
                  child: Text(_progress),
                  backgroundColor: Colors.black45,
                )
              ],
            ),
          ),
        ));
  }
}