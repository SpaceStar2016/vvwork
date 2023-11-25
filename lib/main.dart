import 'package:flutter/material.dart';

import 'home_tabbar_vc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return HomeTabBarVC(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My TabBar'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text('Content for Tab 1'),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
