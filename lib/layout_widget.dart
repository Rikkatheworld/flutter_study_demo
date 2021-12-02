import 'package:flutter/material.dart';

class LayoutWidgetWidgetRoute extends StatefulWidget {
  const LayoutWidgetWidgetRoute({Key? key}) : super(key: key);

  @override
  State<LayoutWidgetWidgetRoute> createState() =>
      _LayoutWidgetWidgetRouteRouteState();
}

class _LayoutWidgetWidgetRouteRouteState
    extends State<LayoutWidgetWidgetRoute> {
  @override
  Widget build(BuildContext context) {
    Widget yellowBox =
    const DecoratedBox(decoration: BoxDecoration(color: Colors.yellow));

    var _children = List.filled(6, const Text("AB"));

    return Scaffold(
      appBar: AppBar(
        title: const Text("LayoutWidget Demo"),
      ),
      // body: Column(children: <Widget>[
      //   // ConstrainedBox(
      //   //   constraints: BoxConstraints(minWidth: double.infinity, minHeight: 50),
      //   //   child: Container(
      //   //     height: 5.0,
      //   //     child: blueBox,
      //   //   ),
      //   // ),
      //   SizedBox(
      //     width: 50,
      //     height: 50,
      //     child: yellowBox,
      //   ),
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("hello   "),
      //       Text("i am Rikka"),
      //     ],
      //   )
      // ]),
      // body: Container(
      //   color: Colors.yellow,
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       mainAxisSize: MainAxisSize.max, // 有效，外层 Column 主轴占满整个屏幕
      //       children: [
      //         Expanded(
      //             child: Container(
      //           color: Colors.red,
      //           child: Column(
      //             mainAxisSize: MainAxisSize.max, // 无效，内层 Column 高度为实际占用高度
      //             children: [Text("hello "), Text("I am Rikka")],
      //           ),
      //         ))
      //       ],
      //     ),
      //   ),
      // ),
      // body: Wrap(
      //   spacing: 8.0, // 主轴(水平)方向间距
      //   runSpacing: 4.0, // 纵轴（垂直）方向间距
      //   alignment: WrapAlignment.center, //沿主轴方向居中
      //   children: const [
      //     Chip(
      //       avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
      //       label: Text('Hamilton'),
      //     ),
      //     Chip(
      //       avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
      //       label: Text('Lafayette'),
      //     ),
      //     Chip(
      //       avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
      //       label: Text('Mulligan'),
      //     ),
      //     Chip(
      //       avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
      //       label: Text('Laurens'),
      //     ),
      //     Chip(
      //       avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
      //       label: Text('Laurens'),
      //     ),
      //     Chip(
      //       avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
      //       label: Text('Laurens'),
      //     ),
      //   ],
      // ),
      // body:Flow(
      //   delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
      //   children: <Widget>[
      //     Container(width: 80.0, height:80.0, color: Colors.green,),
      //     Container(width: 80.0, height:80.0, color: Colors.red,),
      //     Container(width: 80.0, height:80.0, color: Colors.yellow,),
      //     Container(width: 80.0, height:80.0,  color: Colors.blue,),
      //     Container(width: 80.0, height:80.0, color: Colors.brown,),
      //     Container(width: 80.0, height:80.0,  color: Colors.purple,),
      //   ],
      // )
      // body: ConstrainedBox(
      //   constraints: const BoxConstraints.expand(),
      //   child: Stack(
      //     alignment: Alignment.center,
      //     children: [
      //       Container(
      //         child: const Text(
      //           "hello rikka",
      //           style: TextStyle(color: Colors.white),
      //         ),
      //         color: Colors.red,
      //       ),
      //       const Positioned(left: 18.0, child: Text("I am Rikka")),
      //       const Positioned(
      //           top: 18.0, child: Text("Your friendly neighborhood"))
      //     ],
      //   ),
      // ),
      // body: Container(
      //   height: 120,
      //   width: 120,
      //   color: Colors.greenAccent,
      //   child: const Center(
      //     child: FlutterLogo(
      //       size: 60,
      //     ),
      //   ),
      // ),
      // body: Column(
      //   children: [
      //     // 限制宽度为 190
      //     SizedBox(width: 190, child: ResponsiveColumn(children: _children)),
      //     ResponsiveColumn(children: _children),
      //   ],
      // ),
      body: Builder(
        builder: (context) {
          return  GestureDetector(
            child: const Text("HelloRikka"),
            onTap: () => print(context.size), // 打印text的大小
          );
        },
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin;

  TestFlowDelegate({this.margin = EdgeInsets.zero});

  double width = 0;
  double height = 0;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小，简单起见我们让宽度竟可能大，但高度指定为200，
    // 实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

class ResponsiveColumn extends StatelessWidget {
  const ResponsiveColumn({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // 通过 LayoutBuild 拿到父组件传递的约束，然后判断 maxWidth 是否小于200
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 200) {
            // 最大宽度小于 200 ，则显示单列
            return Column(children: children, mainAxisSize: MainAxisSize.min);
          } else {
            // 大于200 则显示双列
            var _children = <Widget>[];
            for (var i = 0; i < children.length; i += 2) {
              if (i + 1 < children.length) {
                _children.add(Row(
                  children: [children[i], children[i + 1]],
                  mainAxisSize: MainAxisSize.min,
                ));
              } else {
                _children.add(children[i]);
              }
            }
            return Column(children: _children, mainAxisSize: MainAxisSize.min);
          }
        });
  }
}