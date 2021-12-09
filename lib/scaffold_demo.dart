import 'package:flutter/material.dart';

class ScaffoldWidgetRoute extends StatefulWidget {
  const ScaffoldWidgetRoute({Key? key}) : super(key: key);

  @override
  State<ScaffoldWidgetRoute> createState() => _ScaffoldWidgetRouteState();
}

class _ScaffoldWidgetRouteState extends State<ScaffoldWidgetRoute> {
  int _selectIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 导航栏
      appBar: AppBar(
        title: const Text("Scaffold Demo"),
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () => {Scaffold.of(context).openDrawer()},
              icon: const Icon(
                Icons.dashboard,
                color: Colors.white,
              ));
        }),
        actions: [
          // 导航栏右侧菜单
          IconButton(onPressed: () {}, icon: Icon(Icons.share))
        ],
      ),
      // 抽屉菜单
      drawer: const MyDrawer(),
      // 底部导航
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "Unit"),
      //     BottomNavigationBarItem(icon: Icon(Icons.school), label: "School")
      //   ],
      //   currentIndex: _selectIndex,
      //   fixedColor: Colors.blue,
      //   onTap: (index) => {},
      // ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            SizedBox(), //中间位置空出
            IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit))
          ],
          // 均分底部导航栏横向空间
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      // 悬浮按钮
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: MediaQuery.removePadding(
            context: context,
            // 移除抽屉菜单顶部默认留白
            removeTop: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ClipOval(
                            child: Image.asset("images/bobo.jpg", width: 80.0),
                          )),
                      const Text("Rikka",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ])),
                Expanded(
                  child: ListView(
                    children: const [
                      ListTile(
                        leading: const Icon(Icons.add),
                        title: Text("Add account"),
                      ),
                      ListTile(
                        leading: const Icon(Icons.settings),
                        title: Text("Settings"),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
