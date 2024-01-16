import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_scalable_ocr/flutter_scalable_ocr.dart';
import 'package:vvword/page/tag_selector.dart';
import '../Utils/UIUtils.dart';

class OcrPage extends StatefulWidget {
  @override
  _OcrPageState createState() => _OcrPageState();
}

class _OcrPageState extends State<OcrPage> {
  final ValueNotifier<List<String>> allTagsNo = ValueNotifier<List<String>>([]);
  List<String> data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VvWordAppBar(
        title: const Text("单词输入"),
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
            GestureDetector(
              onTap: () {
                // 去重
                allTagsNo.value = [...allTagsNo.value,"123123"];
              },
              child: Center(
                child: Text("点我啊！！~~"),
              ),
            ),
            // ScalableOCR(
            //   paintboxCustom: Paint()
            //     ..style = PaintingStyle.stroke
            //     ..strokeWidth = 4.0
            //     ..color = const Color.fromARGB(153, 102, 160, 241),
            //   boxLeftOff: 4,
            //   boxBottomOff: 2.7,
            //   boxRightOff: 4,
            //   boxTopOff: 2.7,
            //   boxHeight: MediaQuery.of(context).size.height / 5,
            //   getRawData: (value) {
            //     inspect(value);
            //   },
            //   getScannedText: (value) {
            //     if (value is String && value.isNotEmpty) {
            //       data.add(value);
            //       // 去重
            //       allTagsNo.value = data.toSet().toList();
            //     }
            //   },
            // ),
            ValueListenableBuilder(
                valueListenable: allTagsNo,
                builder: (context, value, child) {
                  return TagSelector(
                    allTags: value,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
