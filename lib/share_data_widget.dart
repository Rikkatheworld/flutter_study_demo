import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({Key? key, required this.data, required Widget child})
      : super(key: key, child: child);

  // 共享数据，代表被点击的次数
  final int data;

  // 提供一个便捷方法，用于给树中 子Widget 获取共享数据
  static ShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
    return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>()!.widget as ShareDataWidget;
  }

  // 该回调决定了当 data 发生变化的时，是否通知子树中依赖data的widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  State<_TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context)!.data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 父或祖先Widget 中的 InheritedWidget 发生了改变时被调用
    // 如果build中没有依赖，则不会调用该回调
    print("依赖发生了改变");
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRouteState createState() =>
      _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int cnt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShareDataWidget(
          data: cnt,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: _TestWidget()),
              ElevatedButton(
                  onPressed: () => setState(() {
                        ++cnt;
                      }),
                  child: const Text("自增"))
            ],
          ),
        ),
      ),
    );
  }
}
