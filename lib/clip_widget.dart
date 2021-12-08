import 'package:flutter/material.dart';

class ClipWidgetRoute extends StatefulWidget {
  const ClipWidgetRoute({Key? key}) : super(key: key);

  @override
  State<ClipWidgetRoute> createState() => _ClipWidgetRouteState();
}

class _ClipWidgetRouteState extends State<ClipWidgetRoute> {
  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset("images/bobo.jpg", width: 60.0);
    // return Scaffold(
    //     appBar: AppBar(
    //       title: const Text("Basics Demo"),
    //     ),
    //     body: Center(
    //       child: Column(
    //         children: [
    //           avatar, //不剪裁
    //           ClipOval(child: avatar), //剪成圆形
    //           ClipRRect(
    //             //剪裁为圆角矩形
    //             borderRadius: BorderRadius.circular(5.0),
    //             child: avatar,
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Align(
    //                 alignment: Alignment.topLeft,
    //                 widthFactor: .5, //宽度设为原来宽度的一半，另一半则溢出,
    //                 child: avatar,
    //               ),
    //               const Text("Hello Rikka",
    //                   style: TextStyle(color: Colors.blue))
    //             ],
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               ClipRect(
    //                 //将溢出部分裁剪
    //                 child: Align(
    //                   alignment: Alignment.topLeft,
    //                   widthFactor: .5, //宽度设置为原来的一半
    //                   child: avatar,
    //                 ),
    //               ),
    //               const Text(
    //                 "Hello Rikka",
    //                 style: TextStyle(color: Colors.blue),
    //               )
    //             ],
    //           ),
    // DecoratedBox(
    //   decoration: const BoxDecoration(color: Colors.blue),
    //   child: ClipRect(
    //     clipper: CenterClipper(),
    //     child: avatar,
    //   ),
    // )

    // ],
    // ),
    // ));

    return Center(
      child: Column(
        children: [
          wContainer(BoxFit.none),
          Text("Rikka"),
          wContainer(BoxFit.contain),
          Text("The World"),
        ],
      ),
    );
  }

  Widget wContainer(BoxFit boxFit) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: FittedBox(
        fit: boxFit,
        // 子容器超过父容器大小
        child: Container(width: 80, height: 90, color: Colors.blue),
      ),
    );
  }
}

class CenterClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => const Rect.fromLTWH(15.0, 15.0, 30, 30);

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => false;
}
