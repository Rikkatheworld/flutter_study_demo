import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleChildScrollRoute extends StatefulWidget {
  const SingleChildScrollRoute({Key? key}) : super(key: key);

  @override
  State<SingleChildScrollRoute> createState() => _SingleChildScrollRouteState();
}

class _SingleChildScrollRouteState extends State<SingleChildScrollRoute> {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPGRSTUVWXYZ";

    return Scrollbar(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          // 动态创建一个 List<Widget>
          children:
              // 每一个字母都用一个 Text 显示，字体为原来的两倍
              str.split("").map((e) => Text(e, textScaleFactor: 2.0)).toList(),
        ),
      ),
    ));
  }
}
