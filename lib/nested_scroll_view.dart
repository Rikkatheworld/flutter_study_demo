import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NestedScrollViewRoute extends StatefulWidget {
  const NestedScrollViewRoute({Key? key}) : super(key: key);

  @override
  State<NestedScrollViewRoute> createState() => _NestedScrollViewRouteState();
}

class _NestedScrollViewRouteState extends State<NestedScrollViewRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: const Text("嵌套 ListView"),
              pinned: true,
              forceElevated: innerBoxIsScrolled,
            ),
            buildSliverList(5),
          ];
        },
        body: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            physics: const ClampingScrollPhysics(),
            itemCount: 30,
            itemBuilder: (context, index) {
              return SizedBox(
                  height: 50, child: Center(child: Text("Item $index")));
            }),
      ),
    );
  }

  Widget buildSliverList([int count = 5]) {
    return SliverFixedExtentList(
      itemExtent: 50,
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return ListTile(title: Text('$index'));
        },
        childCount: count,
      ),
    );
  }
}