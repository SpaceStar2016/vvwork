import 'package:flutter/material.dart';
import 'package:vvword/page/add_view.dart';
import 'package:vvword/cache/db_utils.dart';
import 'package:vvword/page/add_page.dart';
import 'package:vvword/page/ocr_page.dart';
import 'package:vvword/page/recite_page.dart';
import 'package:vvword/page/text_recognition_page.dart';
import 'page/home_tabbar_vc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 加载数据
  await DBUtils.initData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyTabBarScreen(),
      routes: {
        '/addPage': (context) => AddPage(),
        '/OcrPage': (context) => OcrPage(),
        '/TextRecognitionPage': (context) => TextRecognitionPage(),

      },
    );
  }
}

class MyTabBarScreen extends StatefulWidget {
  const MyTabBarScreen({super.key});
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
        title: const Text('OoWords'),
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
                  const AddView(),
                  // 第二个选项卡的内容
                  Center(
                    child: RecitePage(),
                  ),
                  // 第三个选项卡的内容
                ],
              ),
            ),
            BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                _tabController.animateTo(index);
                _currentIndex = index; // 手动切换TabBarView
                setState(() {});
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '添加',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: '背诵',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
