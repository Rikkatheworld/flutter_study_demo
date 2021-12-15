import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedListRoute extends StatefulWidget {
  const AnimatedListRoute({Key? key}) : super(key: key);

  @override
  State<AnimatedListRoute> createState() => _AnimatedListRouteState();
}

class _AnimatedListRouteState extends State<AnimatedListRoute> {
  var data = <String>[];
  int counter = 5;

  final globalKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    for (var i = 0; i < counter; i++) {
      data.add("${i + 1}");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedList(
              key: globalKey,
              initialItemCount: data.length,
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                // 添加列表项时会执行渐显动画
                return FadeTransition(
                    opacity: animation, child: buildItem(context, index));
              }),
          // 创建一个添加按钮
          buildAddBtn(),
        ],
      ),
    );
  }

  Widget buildAddBtn() {
    return Positioned(
      child: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // 添加一个列表项
          data.add("${++counter}");
          // 告诉列表项有添加的列表项
          globalKey.currentState!.insertItem(data.length - 1);
        },
      ),
      bottom: 30,
      left: 0,
      right: 0,
    );
  }

  // 构建列表项
  Widget buildItem(context, index) {
    String char = data[index];
    return ListTile(
      key: ValueKey(char),
      title: Text(char),
      trailing: IconButton(
          icon: const Icon(Icons.delete),
          // 点击时进行删除
          onPressed: () => onDelete(context, index)),
    );
  }

  void onDelete(context, index) {
    setState(() {
      globalKey.currentState!.removeItem(index, (context, animation) {
        // 删除过程执行的是反向动画， animation.value 会从 1 变成0
        var item = buildItem(context, index);
        data.removeAt(index);
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: const Interval(0.5, 1.0),
          ),
          // 不断缩小列表项的高度
          child: SizeTransition(
            sizeFactor: animation,
            axisAlignment: 0.0,
            child: item,
          ),
        );
      }, duration: const Duration(milliseconds: 200));
    });
  }
}