import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewRoute extends StatefulWidget {
  const GridViewRoute({Key? key}) : super(key: key);

  @override
  State<GridViewRoute> createState() => _GridViewRouteRouteState();
}

class _GridViewRouteRouteState extends State<GridViewRoute> {
  // icon 数据源
  List<IconData> _icons = [];

  @override
  void initState() {
    super.initState();
    // 初始化数据
    _retrieveIcons();
  }

  void _retrieveIcons() {
    Future.delayed(const Duration(milliseconds: 200)).then((value) {
      setState(() {
        _icons.addAll([
          Icons.add,
          Icons.eleven_mp,
          Icons.ten_k,
          Icons.cake,
          Icons.beach_access,
          Icons.free_breakfast,
          Icons.all_inclusive
        ]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //     body: GridView.count(
      //   crossAxisCount: 4,
      //   childAspectRatio: 1.0,
      //   children: const [
      //     Icon(Icons.add),
      //     Icon(Icons.eleven_mp),
      //     Icon(Icons.ten_k),
      //     Icon(Icons.cake),
      //     Icon(Icons.beach_access),
      //     Icon(Icons.free_breakfast),
      //     Icon(Icons.all_inclusive),
      //   ],
      // )
      // body: GridView.extent(
      //   padding: EdgeInsets.zero,
      //   maxCrossAxisExtent: 120.0, childAspectRatio: 2.0,
      //   // 宽高比为2
      //   children: const [
      //     Icon(Icons.add),
      //     Icon(Icons.eleven_mp),
      //     Icon(Icons.ten_k),
      //     Icon(Icons.cake),
      //     Icon(Icons.beach_access),
      //     Icon(Icons.free_breakfast),
      //     Icon(Icons.all_inclusive),
      //   ],
      // ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              // 每行4列
              crossAxisCount: 3,
              childAspectRatio: 1.0),
          itemCount: _icons.length,
          itemBuilder: (context, index) {
            if (index == _icons.length -1 && _icons.length < 200) {
              _retrieveIcons();
            }
            return Icon(_icons[index]);
          }),
    );
  }
}
