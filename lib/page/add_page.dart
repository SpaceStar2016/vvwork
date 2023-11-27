import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/services.dart';

class AddPage extends StatefulWidget {
  AddPage({super.key});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _wordController = TextEditingController();

  final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(140.0), borderSide: BorderSide.none);
  List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("单词输入"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 64,),
              TextField(
                onChanged: (text) {
                  setState(() {});
                },
                controller: _wordController,
                keyboardType: TextInputType.emailAddress,
                keyboardAppearance: Brightness.dark,
                cursorColor: const Color(0xFF7266FF),
                cursorRadius: const Radius.circular(3),
                cursorWidth: 2,
                cursorHeight: 24,
                inputFormatters: inputFormatters,
                decoration: InputDecoration(
                  isCollapsed: true,
                  hintText: "输入英文单词",
                  hintStyle: const TextStyle(
                      fontSize: 44 / 3,
                      color: Color(0xFF999999),
                      height: 24 / 44 / 3 - 0.1),
                  border: border,
                  disabledBorder: border,
                  enabledBorder: border,
                  focusedBorder: border,
                  fillColor: const Color(0xFFFFFFFF),
                  contentPadding: const EdgeInsets.only(
                      left: 20, right: 20, top: 14, bottom: 14),
                  filled: true,
                  suffixIcon: Offstage(
                      offstage: _wordController.text.isEmpty,
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.blue,
                          size: 30.0,
                        ),
                        onPressed: () {
                          // 处理按钮点击事件
                        },
                      )),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: (text) {
                  setState(() {});
                },
                controller: _wordController,
                keyboardType: TextInputType.emailAddress,
                keyboardAppearance: Brightness.dark,
                cursorColor: const Color(0xFF7266FF),
                cursorRadius: const Radius.circular(3),
                cursorWidth: 2,
                cursorHeight: 24,
                inputFormatters: inputFormatters,
                decoration: InputDecoration(
                  isCollapsed: true,
                  hintText: "输入翻译(非必须)",
                  hintStyle: const TextStyle(
                      fontSize: 44 / 3,
                      color: Color(0xFF999999),
                      height: 24 / 44 / 3 - 0.1),
                  border: border,
                  disabledBorder: border,
                  enabledBorder: border,
                  focusedBorder: border,
                  fillColor: const Color(0xFFFFFFFF),
                  contentPadding: const EdgeInsets.only(
                      left: 20, right: 20, top: 14, bottom: 14),
                  filled: true,
                  suffixIcon: Offstage(
                      offstage: _wordController.text.isEmpty,
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.blue,
                          size: 30.0,
                        ),
                        onPressed: () {
                          // 处理按钮点击事件
                        },
                      )),
                ),
              ),
              const Spacer(),
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
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '保存',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}
