import 'package:flutter/material.dart';
import 'package:vvword/home_tabbar_vc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTabBarScreen(),
    );
  }
}

class MyTabBarScreen extends StatefulWidget {
  @override
  _MyTabBarScreenState createState() => _MyTabBarScreenState();
}

class _MyTabBarScreenState extends State<MyTabBarScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar Example'),
      ),
      body: HomeTabBarVC(
        length: 2, // 选项卡的数量
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // 第一个选项卡的内容
                  Center(
                    child: Text('Tab 1 Content'),
                  ),
                  // 第二个选项卡的内容
                  Center(
                    child: Text('Tab 2 Content'),
                  ),
                  // 第三个选项卡的内容
                ],
              ),
            ),
            BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                _tabController.animateTo(index); // 手动切换TabBarView
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Tab 1',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Tab 2',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
