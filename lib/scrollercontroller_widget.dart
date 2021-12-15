import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollControllerRoute extends StatefulWidget {
  const ScrollControllerRoute({Key? key}) : super(key: key);

  @override
  State<ScrollControllerRoute> createState() =>
      _ScrollerControllerRouteState();
}

class _ScrollerControllerRouteState extends State<ScrollControllerRoute> {
  final ScrollController _controller = ScrollController();

  //是否显示“返回到顶部”的按钮
  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();
    // 监听滚动事件, 打印滚动事件
    _controller.addListener(() {
      print("offset: ${_controller.offset}");
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && !showToTopBtn) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // 避免内存泄漏，需要回收 ScrollerController
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("滚动控制")),
      body: Scrollbar(
        child: ListView.builder(
            itemCount: 100,
            itemExtent: 45,
            controller: _controller,
            itemBuilder: (context, index) {
              return ListTile(title: Text("$index"));
            }),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              onPressed: () {
                // 回到顶部
                _controller.animateTo(.0,
                    duration: const Duration(milliseconds: 200), curve: Curves.ease);
              },
              child: const Icon(Icons.arrow_upward)),
    );
  }
}
