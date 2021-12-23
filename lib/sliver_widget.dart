import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverWidgetRoute extends StatefulWidget {
  const SliverWidgetRoute({Key? key}) : super(key: key);

  @override
  State<SliverWidgetRoute> createState() => _SliverWidgetRouteState();
}

class _SliverWidgetRouteState extends State<SliverWidgetRoute> {
  // @override
  // Widget build(BuildContext context) {
  //   return Material(
  //       child: CustomScrollView(
  //     slivers: [
  //       // App Bar, 是一个导航栏
  //       SliverAppBar(
  //         // 滑动到顶端时会固定住
  //         pinned: true,
  //         expandedHeight: 250.0,
  //         flexibleSpace: FlexibleSpaceBar(
  //           title: const Text("Sliver Demo"),
  //           background: Image.asset("images/bobo.jpg", fit: BoxFit.cover),
  //         ),
  //       ),
  //       SliverPadding(
  //         padding: const EdgeInsets.all(10.0),
  //         sliver: SliverGrid(
  //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //               // 两列显示
  //               crossAxisCount: 2,
  //               mainAxisSpacing: 10.0,
  //               crossAxisSpacing: 10.0,
  //               childAspectRatio: 3.0),
  //           delegate: SliverChildBuilderDelegate((context, index) {
  //             return Container(
  //               alignment: Alignment.center,
  //               // 渐变
  //               color: Colors.cyan[100 * (index % 9)],
  //               child: Text("grid item $index"),
  //             );
  //           }, childCount: 20),
  //         ),
  //       ),
  //       SliverFixedExtentList(
  //           delegate: SliverChildBuilderDelegate((context, index) {
  //             return Container(
  //               alignment: Alignment.center,
  //               color: Colors.lightBlue[100 * index % 9],
  //               child: Text("list item $index"),
  //             );
  //           }, childCount: 20),
  //           itemExtent: 50.0),
  //     ],
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        // 为了能使 CustomScrollView 拉到顶部时还能继续往下拉，必须要 physics 支持弹性的效果
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          // 需要实 现一个 SliverFlexibleHeader 组件
          SliverFlexibleHeader(
              // 初始状态在列表中占用的布局高度
              visibleExtent: 200.0,
              // 为了能根据下拉状态变化来定制显示的布局，我们通过一个 builder 来动态构建布局
              builder: (context, availableHeight) {
                return GestureDetector(
                  onTap: () => print("tap"),
                  child: Image(
                    image: AssetImage("images/bobo.jpg"),
                    width: 50.0,
                    height: availableHeight,
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.cover,
                  ),
                );
              }),
          buildSliverList(30)
        ],
      ),
    );
  }

  Widget buildSliverList(int count) {
    return ListView.builder(
        itemBuilder: (_, index) {
          return ListTile(title: Text("$index"));
        },
        itemExtent: 40.0,
        itemCount: count);
  }
}

typedef SliverFlexibleHeaderBuilder = Widget Function(
    BuildContext context, double maxExtent);

class SliverFlexibleHeader extends StatelessWidget {
  const SliverFlexibleHeader(
      {Key? key, this.visibleExtent = 0, required this.builder})
      : super(key: key);

  final SliverFlexibleHeaderBuilder builder;
  final double visibleExtent;

  @override
  Widget build(BuildContext context) {
    return _SliverFlexibleHeader(
        visibleExtent: visibleExtent,
        child: LayoutBuilder(
          builder: (context, constraints) =>
              builder(context, constraints.maxHeight),
        ));
  }
}

class _SliverFlexibleHeader extends SingleChildRenderObjectWidget {
  const _SliverFlexibleHeader(
      {Key? key, required Widget child, this.visibleExtent = 0})
      : super(key: key, child: child);

  final double visibleExtent;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _FlexibleHeaderRenderSliver(visibleExtent);
  }

  @override
  void updateRenderObject(
      BuildContext context, _FlexibleHeaderRenderSliver renderObject) {
    renderObject.visibleExtent = visibleExtent;
  }
}

class _FlexibleHeaderRenderSliver extends RenderSliverSingleBoxAdapter {
  _FlexibleHeaderRenderSliver(double visibleExtent)
      : _visibleExtent = visibleExtent;
  double _lastOverScroll = 0;
  double _lastScrollOffset = 0;
  late double _visibleExtent = 0;

  set visibleExtent(double value) {
    // 可是长度发生变化， 就会回调这个方法，更新状态并重新布局
    if (_visibleExtent != value) {
      _lastOverScroll = 0;
      _visibleExtent = value;
      // 需要 Layout
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    // 滑动距离大于 visibleExtent 则表示子节点已经在屏幕之外了
    if (child == null || (constraints.scrollOffset > _visibleExtent)) {
      geometry = SliverGeometry(scrollExtent: _visibleExtent);
      return;
    }

    // 测试 overlap， 下拉过程中会一直变化
    double overScroll = constraints.overlap < 0 ? constraints.overlap.abs() : 0;
    var scrollOffset = constraints.scrollOffset;

    // 在 Viewport 中顶部的可视空间为该 Sliver 可绘制的最大区域
    // 1. 如果 Sliver 已经滑出可视区域则 constraints.scrollOffset 会大于 _visibleExtent,
    //    这种情况下我们在一开始就判断了
    // 2. 如果我们下拉超出了便捷，此时 overScroll > 0, scrollOffset 值为0,所以最终绘制区域为
    //    _visibleExtent + overScroll
    double paintExtent = _visibleExtent + overScroll - constraints.scrollOffset;
    // 绘制高度不超过最大可绘制空间
    paintExtent = min(paintExtent, constraints.remainingPaintExtent);

    // 对子组件进行布局， 这里只需要知道子组件通过 LayoutBuilder 可以拿到我们这里传递的约束对象
    child!.layout(constraints.asBoxConstraints(maxExtent: paintExtent),
        parentUsesSize: false);

    // 最大为 _visibleExtent ，最小为0
    double layoutExtent = min(_visibleExtent, paintExtent);

    // 设置 geometry, Viewport 在布局时会用到
    geometry = SliverGeometry(
        scrollExtent: layoutExtent,
        paintOrigin: -overScroll,
        paintExtent: paintExtent,
        layoutExtent: layoutExtent);
  }
}
