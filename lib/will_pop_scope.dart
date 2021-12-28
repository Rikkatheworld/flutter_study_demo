import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WillPopScopeRoute extends StatefulWidget {
  const WillPopScopeRoute({Key? key}) : super(key: key);

  @override
  State<WillPopScopeRoute> createState() => _WillPopScopeRouteState();
}

class _WillPopScopeRouteState extends State<WillPopScopeRoute> {
  // 上次的点击时间
  DateTime? _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt!) >
                const Duration(seconds: 1)) {
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text("1s 内连续按两次返回键退出"),
      ),
    ));
  }
}
