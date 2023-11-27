import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class AddPage extends StatefulWidget {
  AddPage({super.key});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController textField1Controller = TextEditingController();
  TextEditingController textField2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: textField1Controller,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: textField2Controller,
            decoration: const InputDecoration(
              labelText: 'Text Field 2',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // 按钮点击事件
              print('Button pressed!');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 按钮颜色
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // 圆角大小
              ),
            ),
            child: const Padding(
              padding:  EdgeInsets.all(16.0),
              child: Text(
                'Click Me',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
