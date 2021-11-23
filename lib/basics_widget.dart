import 'package:flutter/material.dart';

class BasicsWidgetRoute extends StatefulWidget {
  const BasicsWidgetRoute({Key? key}) : super(key: key);

  @override
  State<BasicsWidgetRoute> createState() => _BasicsWidgetRouteState();
}

class _BasicsWidgetRouteState extends State<BasicsWidgetRoute> {
  final TextEditingController _tfController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tfController.addListener(() {
      print(_tfController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basics Demo"),
      ),
      body: Column(children: <Widget>[
        TextField(
          controller: _tfController,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: "用户名",
            hintText: "请输入用户名或密码",
            prefixIcon: Icon(Icons.person)
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            labelText: "密码",
            hintText: "请输入密码",
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
        )
      ]),
    );
  }
}
