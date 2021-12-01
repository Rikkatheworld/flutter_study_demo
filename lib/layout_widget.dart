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
      body: Container(
        height: 120,
        width: 120,
        color: Colors.greenAccent,
        child: const Center(
          child: FlutterLogo(
            size: 60,
          ),
        ),
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
