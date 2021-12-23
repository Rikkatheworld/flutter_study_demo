import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverAppBarRoute extends StatefulWidget {
  const SliverAppBarRoute({Key? key}) : super(key: key);

  @override
  State<SliverAppBarRoute> createState() => _SliverAppBarRouteState();
}

class _SliverAppBarRouteState extends State<SliverAppBarRoute> {
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: NestedScrollView(
  //       headerSliverBuilder: (context, innerBoxIsScrolled) {
  //         return [
  //           // 实现 snap 效果
  //           SliverOverlapAbsorber(
  //             handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
  //             sliver: SliverAppBar(
  //               floating: true,
  //               snap: true,
  //               expandedHeight: 200,
  //               forceElevated: innerBoxIsScrolled,
  //               flexibleSpace: FlexibleSpaceBar(
  //                   background:
  //                       Image.asset("images/bobo.jpg", fit: BoxFit.cover)),
  //             ),
  //           )
  //         ];
  //       },
  //       body: Builder(builder: (context) {
  //         return CustomScrollView(
  //           slivers: [
  //             SliverOverlapInjector(
  //                 handle:
  //                     NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
  //             buildSliverList(100)
  //           ],
  //         );
  //       }),
  //     ),
  //   );
  // }

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

  @override
  Widget build(BuildContext context) {
    final _tabs = ["消息", "发现", "我的"];
    return DefaultTabController(length: _tabs.length, child: Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(handle: NestedScrollView
                .sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: Text("商城"),
                  floating: true,
                  snap: true,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    tabs: _tabs.map((name) => Tab(text: name)).toList(),
                  ),
                )),
          ];
        },
        body: TabBarView(
          children: _tabs.map((String name) {
            return Builder(
              builder: (BuildContext context) {
                return CustomScrollView(
                  key: PageStorageKey<String>(name),
                  slivers: [
                    SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context)),
                    SliverPadding(padding: const EdgeInsets.all(10.0),
                      sliver: buildSliverList(50),),
                  ],
                );
              },
            );
          }).toList(),
        ),
      ),
    ));
  }
}
