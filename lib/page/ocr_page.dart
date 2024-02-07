import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_scalable_ocr/flutter_scalable_ocr.dart';
import 'package:vvword/page/tag_selector.dart';
import '../Utils/UIUtils.dart';

class OcrPage extends StatefulWidget {

  Function(String) ? cb;
  @override
  _OcrPageState createState() => _OcrPageState();
}

class _OcrPageState extends State<OcrPage> {
  final ValueNotifier<List<String>> allTagsNo = ValueNotifier<List<String>>([]);


  List<String> data = [];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: VvWordAppBar(
          title: const Text("扫描获取单词"),
          leading: CustomBackButton(
            icon: Png.name('mine_icon_back', width: 24),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              ScalableOCR(
                paintboxCustom: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 4.0
                  ..color = const Color.fromARGB(153, 102, 160, 241),
                boxLeftOff: 4,
                boxBottomOff: 2.7,
                boxRightOff: 4,
                boxTopOff: 2.7,
                boxHeight: MediaQuery.of(context).size.height / 5,
                getRawData: (value) {
                  // inspect(value);
                },
                // 这里调用了setState, 所以要加 addPostFrameCallback
                getScannedText: (value) {
                  if (value is String && value.isNotEmpty) {
                    final vv = keepOnlyLetters(value);
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      allTagsNo.value = [vv];
                    });
                  }
                },
              ),

              // ValueListenableBuilder(
              //   valueListenable: allTagsNo,
              //   builder: (context, value, child) {
              //     _controller.text = value.first;
              //     return LanguageToolTextField(
              //       controller: _controller,
              //       language: 'en-US',
              //     );
              //   },
              // ),

              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide.none,
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(100, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  foregroundColor: Colors.white,
                  backgroundColor: UIUtils.themeBlue,
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  if (widget.cb != null) {
                    widget.cb!(allTagsNo.value.first);
                  }
                  Navigator.pop(context);
                },
                child: const Text(
                  "确定",
                  style: TextStyle(color: UIUtils.themeCharacterWhite),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String keepOnlyLetters(String input) {
    // 使用正则表达式匹配所有英文单词字符
    RegExp regExp = RegExp(r'[a-zA-Z]+');
    Iterable<Match> matches = regExp.allMatches(input);

    // 将匹配到的字符连接起来
    String result = matches.map((match) => match.group(0)!).join();

    return result;
  }
}
