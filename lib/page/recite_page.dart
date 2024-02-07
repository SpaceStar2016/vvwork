import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:vvword/Model/vocabulary.dart';
import 'package:vvword/Utils/common_util.dart';
import 'package:vvword/app_setting.dart';
import 'package:vvword/cache/db_utils.dart';

import '../Utils/UIUtils.dart';

class RecitePage extends StatefulWidget {
  const RecitePage({super.key});

  @override
  State<RecitePage> createState() => _RecitePageState();
}

class _RecitePageState extends State<RecitePage> {
  FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('my-widget-key'),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;
        debugPrint(
            'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('单词背诵'),
        ),
        body: DBUtils.vocabularies.isEmpty
            ? const ReciteEmptyView()
            : Swiper(
                itemBuilder: (context, index) {
                  var word = DBUtils.vocabularies[index];
                  return Center(
                    child: WordCard(
                      flutterTts: flutterTts,
                      word: word,
                      updateParent: () {
                        setState(() {});
                      },
                    ),
                  );
                },
                indicatorLayout: PageIndicatorLayout.COLOR,
                itemCount: DBUtils.vocabularies.length,
                pagination: const SwiperPagination(),
                viewportFraction: 0.8,
                scale: 0.9,
              ),
      ),
    );
  }
}

class WordCard extends StatefulWidget {
  final Function updateParent;

  FlutterTts flutterTts;

  Vocabulary word;

  WordCard(
      {required this.flutterTts,
      required this.word,
      required this.updateParent,
      super.key});

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.word.word,
                    style: const TextStyle(
                      fontSize: 24,
                      color: UIUtils.themeCharacterBlack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: () async {
                      final data = ClipboardData(text: widget.word.word);
                      await Clipboard.setData(data);
                      EasyLoading.showSuccess('复制成功');
                    },
                    child: Png.name("copy",width: 20),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Opacity(
                opacity: 1.0,
                child: GestureDetector(
                  onTap: () {
                    CommonUtil.launchURL("https://fanyi.baidu.com/?aldtype=16047&ext_channel=Aldtype#auto/zh/${widget.word.word}");
                  },
                  child: const Text(
                    "获取互联网翻译" ,
                    style:  TextStyle(
                      fontSize: 18,
                      color: UIUtils.themeCharacterBlack,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  widget.flutterTts.speak(widget.word.word).then((value) {});
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    color: UIUtils.themeCharacterWhite,
                  ),
                ),
                child: const Text('发音'),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: () {
              DBUtils.deleteVocabulary(widget.word);
              // 刷新UI
              widget.updateParent();
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Png.name("delete", width: 20),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Png.name("show_translation", width: 20),
            ),
          ),
        ),
      ],
    );
  }
}

class ReciteEmptyView extends StatelessWidget {
  const ReciteEmptyView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "请添加单词",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
