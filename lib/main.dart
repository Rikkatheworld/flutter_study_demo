import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basics_widget.dart';
import 'package:flutter_study_demo/form_demo.dart';
import 'package:flutter_study_demo/layout_widget.dart';
import 'package:flutter_study_demo/scaffold_demo.dart';
import 'package:flutter_study_demo/single_line_container_widget.dart';

import 'clip_widget.dart';
import 'countainer_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyAppHomePage());
  }
}

class MyAppHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter demo'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: const Text(
              'Basics Widget',
              style: TextStyle(fontSize: 10),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BasicsWidgetRoute()));
            },
          ),
          ElevatedButton(
            child: const Text(
              'Form Widget',
              style: TextStyle(fontSize: 10),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FormTestRoute()));
            },
          ),
          ElevatedButton(
            child: const Text(
              'LayoutWidget Widget',
              style: TextStyle(fontSize: 10),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LayoutWidgetWidgetRoute()));
            },
          ),
          ElevatedButton(
            child: const Text(
              '容器 Widget',
              style: TextStyle(fontSize: 10),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ContainerWidgetWidgetRoute()));
            },
          ),
          ElevatedButton(
            child: const Text(
              'Clip demo',
              style: TextStyle(fontSize: 10),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ClipWidgetRoute()));
            },
          ),
          ElevatedButton(
            child: const Text(
              'Single line container demo',
              style: TextStyle(fontSize: 10),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SingleLineContainerWidgetRoute()));
            },
          ),
          ElevatedButton(
            child: const Text(
              'Scaffold demo',
              style: TextStyle(fontSize: 10),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ScaffoldWidgetRoute()));
            },
          ),
        ],
      ),
    );
  }
}
