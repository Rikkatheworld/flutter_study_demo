import 'package:flutter/material.dart';

class SingleLineContainerWidgetRoute extends StatefulWidget {
  const SingleLineContainerWidgetRoute({Key? key}) : super(key: key);

  @override
  State<SingleLineContainerWidgetRoute> createState() =>
      _SingleLineContainerWidgetRouteState();
}

class _SingleLineContainerWidgetRouteState
    extends State<SingleLineContainerWidgetRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basics Demo"),
      ),
      body: Center(
        child: Column(
          children: [
            _wRow(" 90000000000000000000000000 "),
            SingleLineFittedBox(child: _wRow(" 90000000000000000000000000  ")),
            _wRow(" 800 "),
            SingleLineFittedBox(child: _wRow(" 800 ")),
          ]
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: e,
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget _wRow(String text) {
    Widget result = Text(text);
    result = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [result, result, result],
    );
    return result;
  }
}

class SingleLineFittedBox extends StatelessWidget {
  const SingleLineFittedBox({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return FittedBox(
          child: ConstrainedBox(
        constraints: constraints.copyWith(
            minWidth: constraints.maxWidth, maxWidth: double.infinity),
        child: child,
      ));
    });
  }
}
