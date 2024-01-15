import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_scalable_ocr/flutter_scalable_ocr.dart';

class OcrPage extends StatefulWidget {
  @override
  _OcrPageState createState() => _OcrPageState();
}

class _OcrPageState extends State<OcrPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: 200,
          child: ScalableOCR(
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
              inspect(value);
            },
            getScannedText: (value) {
              print("value:$value");
            },
          ),
        )
      ],
    );
  }
}
