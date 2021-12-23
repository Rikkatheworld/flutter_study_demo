import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarViewRoute extends StatefulWidget {
  const TabBarViewRoute({Key? key}) : super(key: key);

  @override
  State<TabBarViewRoute> createState() => _TabBarViewRouteState();
}

class _TabBarViewRouteState extends State<TabBarViewRoute>
    with SingleTickerProviderStateMixin {
  final ScrollController _controller = ScrollController();

  late TabController _tabController;
  List tabs = ["吃的", "穿的", "住的", "行的"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     appBar: AppBar(
    //         title: const Text("TabBarView"),
    //         bottom: TabBar(
    //           controller: _tabController,
    //           tabs: tabs.map((e) => Tab(text: e)).toList(),
    //         )),
    //     body: TabBarView(
    //       controller: _tabController,
    //       children: tabs.map((e) {
    //         return Container(
    //           alignment: Alignment.center,
    //           child: Text(e, textScaleFactor: 5),
    //         );
    //       }).toList(),
    //     ));
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
            appBar: AppBar(
                title: const Text("TabBarView"),
                bottom: TabBar(
                  controller: _tabController,
                  tabs: tabs.map((e) => Tab(text: e)).toList(),
                )),
            body: TabBarView(
              controller: _tabController,
              children: tabs.map((e) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(e, textScaleFactor: 5),
                );
              }).toList(),
            )));
  }

  @override
  void dispose() {
    // 释放资源
    _tabController.dispose();
    super.dispose();
  }
}
