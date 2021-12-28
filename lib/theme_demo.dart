import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeRoute extends StatefulWidget {
  const ThemeRoute({Key? key}) : super(key: key);

  @override
  State<ThemeRoute> createState() => _ThemeRouteState();
}

class _ThemeRouteState extends State<ThemeRoute> {
  // 当前主题颜色
  MaterialColor _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
          // 用于导航栏、 FloatingActionButton 的颜色
          primarySwatch: _themeColor,
          // 用于 Icon 的颜色
          iconTheme: IconThemeData(color: _themeColor)),
      child: Scaffold(
        appBar: AppBar(title: Text("主题测试")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 第一行 Icon 使用主题中的 iconTheme
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite),
                Icon(Icons.airport_shuttle),
                Text("颜色跟随主题")
              ],
            ),
            // 第二行 Icon 自定义颜色
            Theme(
              data: themeData.copyWith(
                  iconTheme: themeData.iconTheme.copyWith(color: Colors.blue)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text("颜色固定蓝色")
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => _themeColor =
              _themeColor == Colors.teal ? Colors.green : Colors.teal),
          child: Icon(Icons.palette),
        ),
      ),
    );
  }
}
