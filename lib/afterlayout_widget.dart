import 'package:flutter/material.dart';

class AfterLayoutRoute extends StatefulWidget {
  const AfterLayoutRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AfterLayoutRouteState();
}

class _AfterLayoutRouteState extends State<AfterLayoutRoute> {
  final String _text = "rikka afterlayout";
  final Size _size = Size.zero;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(builder: (context) {
            return GestureDetector(
              child: const Text(
                "Text1: 点我获取大小",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () => print("Text1:${context.size}"),
            );
          }),
        ),
      ],
    );
  }
}
