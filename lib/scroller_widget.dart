import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollerWidgetRoute extends StatefulWidget {
  const ScrollerWidgetRoute({Key? key}) : super(key: key);

  @override
  State<ScrollerWidgetRoute> createState() => _ScrollWidgetRoteState();
}

class _ScrollWidgetRoteState extends State<ScrollerWidgetRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoScrollbar(
        child: SingleChildScrollView(

        ),
      ),
    );
  }
}
