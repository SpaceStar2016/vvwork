
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Utils/UIUtils.dart';
// 需要做缓存
class TextRecognitionPage extends StatefulWidget {
  @override
  _TextRecognitionPageState createState() => _TextRecognitionPageState();
}

class _TextRecognitionPageState extends State<TextRecognitionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: UIUtils.themeBackground,
      child: Center(
        child:OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide.none,
            padding: EdgeInsets.zero,
            minimumSize: const Size(100, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            foregroundColor: Colors.white,
            backgroundColor:  UIUtils.themeBlue,
            textStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600),
          ),
          onPressed: (){
          },
          child: const Text(
            "选择图片",
            style: TextStyle(color: UIUtils.themeCharacterWhite),
          ),
        ),
      ),
    );
  }
}
