import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageViewRoute extends StatefulWidget {
  const PageViewRoute({Key? key}) : super(key: key);

  @override
  State<PageViewRoute> createState() => _PageViewRouteState();
}

class _PageViewRouteState extends State<PageViewRoute> {
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    // 设置六个Tab
    for (int i = 0; i < 6; i++) {
      children.add(Page(
        text: "$i",
      ));
    }
    return Scaffold(body: PageView(children: children));
  }
}

class Page extends StatefulWidget {
  const Page({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("build ${widget.text}");

    return Center(
        child: Text(
      widget.text,
      textScaleFactor: 5,
    ));
  }

  @override
  bool get wantKeepAlive => true; // 需要缓存
}
