import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({required this.data, required Widget child})
      : super(child: child);

  final T data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // 这里先返回true
    return true;
  }
}

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({Key? key, required this.data, required this.child});

  final Widget child;
  final T data;

  static T? of<T>(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
    return provider!.data;
  }

  @override
  State<StatefulWidget> createState() => _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider> {
  void update() {
    setState(() {
      // 如果数据发生了变化，则重新构建 InheritedProvider
    });
  }

  @override
  void didUpdateWidget(
      covariant ChangeNotifierProvider<ChangeNotifier> oldWidget) {
    if (widget.data != oldWidget.data) {
      // 当 Provider 更新时，如果新旧数据不相同，则解绑截数据监听，同时添加新数据监听
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // 给 model 添加监听器
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider(
      data: widget.data,
      child: widget.child,
    );
  }
}

class Item {
  Item(this.price, this.count);

  // 商品单价
  double price;

  // 商品数量
  int count;
}

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  // 禁止改变购物车里面的信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // 总价
  double get totalPrice => _items.fold(
      0,
      (previousValue, element) =>
          previousValue + element.count * element.price);

  // 将 [item] 添加到购物车， 该方法的作用是外部改变购物车
  void add(Item item) {
    _items.add(item);
    // 通知订阅者重新构建 InheritedProvider 来更新状态
    notifyListeners();
  }
}

class ProviderRoute extends StatefulWidget {
  const ProviderRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(builder: (context) {
            return Column(
              children: [
                Builder(builder: (context) {
                  var cart = ChangeNotifierProvider.of<CartModel>(context);
                  return Text("总价为:${cart?.totalPrice}");
                }),
                Builder(builder: (context) {
                  print("ElevatedButton build");
                  return ElevatedButton(
                      onPressed: () {
                        ChangeNotifierProvider.of<CartModel>(context)
                            ?.add(Item(15, 1));
                      },
                      child: Text("添加商品"));
                })
              ],
            );
          }),
        ),
      ),
    );
  }
}
