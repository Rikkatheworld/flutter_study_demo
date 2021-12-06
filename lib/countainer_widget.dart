import 'package:flutter/material.dart';

class ContainerWidgetWidgetRoute extends StatefulWidget {
  const ContainerWidgetWidgetRoute({Key? key}) : super(key: key);

  @override
  State<ContainerWidgetWidgetRoute> createState() =>
      _ContainerWidgetWidgetRouteState();
}

class _ContainerWidgetWidgetRouteState
    extends State<ContainerWidgetWidgetRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basics Demo"),
      ),
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.all(20.0), // 所有方向留白20像素
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text("右边留白"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text("上下留白"),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(5, 20, 20, 8),
                    child: Text("四周留白")),
              ],
            )),
        // DecoratedBox(
        //   decoration: BoxDecoration(
        //     gradient:const  LinearGradient(colors: [Colors.blue, Colors.purple]), // 匀速渐变
        //     borderRadius:  BorderRadius.circular(5.0), //圆角
        //     boxShadow: const [
        //       BoxShadow(
        //         color: Colors.black54, //阴影颜色
        //         offset: Offset(2.0, 2.0), // 阴影深度
        //         blurRadius: 6.0  //阴影圆角
        //       )
        //     ]
        //   ),
        //   child: const Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18.0),
        //     child: Text("Rikka", style: TextStyle(color: Colors.white))
        //   ),
        // ),
        Container(
          color: Colors.yellow,
          child: Transform(
            alignment: Alignment.topRight, // 相对坐标系原点的对齐方式
            transform: Matrix4.skewY(0.3), // 沿着 Y 轴倾斜 0.3
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.deepOrange,
              child:  Text("This is Funker"),
            ),
          ),
        )
      ]),
    );
  }
}
