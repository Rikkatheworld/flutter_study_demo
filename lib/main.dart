import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basics_widget.dart';
import 'package:flutter_study_demo/form_demo.dart';
import 'package:flutter_study_demo/grid_view_widget.dart';
import 'package:flutter_study_demo/layout_widget.dart';
import 'package:flutter_study_demo/scaffold_demo.dart';
import 'package:flutter_study_demo/scroll_notification_widget.dart';
import 'package:flutter_study_demo/scroller_widget.dart';
import 'package:flutter_study_demo/scrollercontroller_widget.dart';
import 'package:flutter_study_demo/single_child_scroll_view.dart';
import 'package:flutter_study_demo/single_line_container_widget.dart';

import 'animated_list.dart';
import 'clip_widget.dart';
import 'countainer_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MyAppHomePage());
  }
}

class MyAppHomePage extends StatelessWidget {
  const MyAppHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter demo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
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
                          builder: (context) =>
                              const LayoutWidgetWidgetRoute()));
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
                          builder: (context) =>
                              const ContainerWidgetWidgetRoute()));
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
                          builder: (context) =>
                              const SingleLineContainerWidgetRoute()));
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
              ElevatedButton(
                child: const Text(
                  'SingleChildScrollView demo',
                  style: TextStyle(fontSize: 10),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SingleChildScrollRoute()));
                },
              ),
              ElevatedButton(
                child: const Text(
                  'SingleChildScrollView demo',
                  style: TextStyle(fontSize: 10),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SingleChildScrollRoute()));
                },
              ),
              ElevatedButton(
                child: const Text(
                  'ListView demo',
                  style: TextStyle(fontSize: 10),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const ScrollerWidgetRoute()));
                },
              ),
              ElevatedButton(
                child: const Text(
                  'ScrollController demo',
                  style: TextStyle(fontSize: 10),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const ScrollControllerRoute()));
                },
              ),
              ElevatedButton(
                child: const Text(
                  'NotificationListener Scroll Widget demo',
                  style: TextStyle(fontSize: 10),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const ScrollNotificationRoute()));
                },
              ),
              ElevatedButton(
                child: const Text(
                  'AnimatedList demo',
                  style: TextStyle(fontSize: 10),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const AnimatedListRoute()));
                },
              ),
              ElevatedButton(
                child: const Text(
                  'GridView demo',
                  style: TextStyle(fontSize: 10),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const GridViewRoute()));
                },
              ),
            ],
          ),
        ));
  }
}
