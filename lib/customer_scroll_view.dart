import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomViewRoute extends StatefulWidget {
  const CustomViewRoute({Key? key}) : super(key: key);

  @override
  State<CustomViewRoute> createState() => _CustomViewRouteState();
}

class _CustomViewRouteState extends State<CustomViewRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildTwoListView());
  }

  // Widget buildTwoListView() {
  //   var listView = ListView.builder(
  //       itemBuilder: (_, index) => ListTile(title: Text("$index")),
  //       itemCount: 20);
  //
  //   return Column(
  //     children: [
  //       Expanded(child: listView,),
  //       const Divider(color: Colors.grey),
  //       Expanded(child: listView)
  //     ],
  //   );
  // }
  Widget buildTwoListView() {
    var listView = SliverFixedExtentList(
        itemExtent: 50,
        delegate: SliverChildBuilderDelegate(
            (_, index) => ListTile(title: Text("$index")),
            childCount: 15));

    return CustomScrollView(
      slivers: [listView, listView],
    );
  }
}
