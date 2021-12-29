import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ValueListenableRoute extends StatefulWidget {
  const ValueListenableRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ValueListenableState();
}

class _ValueListenableState extends State<ValueListenableRoute> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  static const double textScaleFactor = 1.5;

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder<int>(
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child!,
                Text("$value times", textScaleFactor: textScaleFactor)
              ],
            );
          },
          child: const Text("click", textScaleFactor: textScaleFactor),
          valueListenable: _counter,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _counter.value++,
      ),
    );
  }
}
