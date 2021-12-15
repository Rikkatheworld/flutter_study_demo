import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';

class ScrollerWidgetRoute extends StatefulWidget {
  const ScrollerWidgetRoute({Key? key}) : super(key: key);

  @override
  State<ScrollerWidgetRoute> createState() => _ScrollWidgetRoteState();
}

// class _ScrollWidgetRoteState extends State<ScrollerWidgetRoute> {
//   // 表尾标记
//   static const loadingTag = "##loading##";
//
//   // _words 是一个 String 数组，也是 ListView 的数据源
//   final _words = <String>[loadingTag];
//
//   @override
//   void initState() {
//     super.initState();
//     _retrieveData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ListView.separated(
//             itemBuilder: (context, index) {
//               // 如果到了表尾
//               if (_words[index] == loadingTag) {
//                 // 没有100条，继续获取数据
//                 if (_words.length < 101) {
//                   // 异步拉取数据, 用一个 loading 态展示
//                   _retrieveData();
//                   return Container(
//                     padding: const EdgeInsets.all(18.0),
//                     alignment: Alignment.center,
//                     child: const SizedBox(
//                         width: 24.0,
//                         height: 24.0,
//                         child: CircularProgressIndicator(strokeWidth: 2.0)),
//                   );
//                 } else {
//                   // 已经加载了 100条数据，不再获取数据
//                   return Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(18.0),
//                     child: const Text(
//                       "没有更多了",
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   );
//                 }
//               }
//               // 显示单词列表
//               return ListTile(title: Text(_words[index]));
//             },
//             separatorBuilder: (context, index) => const Divider(height: .0),
//             itemCount: _words.length));
//   }
//
//   void _retrieveData() {
//     Future.delayed(const Duration(seconds: 2)).then((value) {
//       setState(() {
//         // 重新构建列表
//         _words.insertAll(
//             _words.length - 1,
//             // 每次生成20个单词
//             generateWordPairs()
//                 .take(20)
//                 .map((e) => e.asPascalCase)
//                 .toList());
//       });
//     });
//   }
// }

class _ScrollWidgetRoteState extends State<ScrollerWidgetRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const ListTile(title: Text("我是表头")),
        Expanded(
            child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("$index"));
            })),
      ],
    ));
  }
}
