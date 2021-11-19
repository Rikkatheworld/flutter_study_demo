import 'package:flutter/material.dart';

class BasicsWidgetRoute extends StatelessWidget {
  const BasicsWidgetRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basics Demo"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("i am ElevatedButton"),
          onPressed: () {},
        ),
      ),
    );
  }
}
