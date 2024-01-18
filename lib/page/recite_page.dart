import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:vvword/app_setting.dart';
import 'package:vvword/cache/db_utils.dart';

import '../Utils/UIUtils.dart';

class RecitePage extends StatelessWidget {
  const RecitePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('单词背诵'),
      ),
      body: DBUtils.vocabularies.isEmpty ? const ReciteEmptyView() : Swiper(
        itemBuilder: (context, index) {
          var word  = DBUtils.vocabularies[index];
          return Center(
            child: WordCard(word:word.word),
          );
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        itemCount: DBUtils.vocabularies.length,
        pagination: const SwiperPagination(),
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    );
  }
}

class WordCard extends StatelessWidget {
  String word; // 替换为实际单词
  String? translation = "Flutter Translation";

  WordCard({required this.word ,super.key}); // 替换为实际翻译

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            word,
            style: const TextStyle(
              fontSize: 24,
              color: UIUtils.themeCharacterBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            translation ?? "",
            style: const TextStyle(
              fontSize: 18,
              color: UIUtils.themeCharacterBlack,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // 处理发音按钮点击事件
              // TODO: 在这里添加处理发音的逻辑
            },
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                color: UIUtils.themeCharacterWhite,
              ),
            ),
            child: Text('发音'),
          ),
        ],
      ),
    );
  }
}

class ReciteEmptyView extends StatelessWidget {
  const ReciteEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "请添加单词"
    );
  }
}