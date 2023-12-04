import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:vvword/app_setting.dart';
import 'package:vvword/cache/db_utils.dart';

class RecitePage extends StatelessWidget {
  const RecitePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExampleHorizontal'),
      ),
      body: Swiper(
        itemBuilder: (context, index) {
          var word  = DBUtils.vocabularies[index];
          return Text(word.word);
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        itemCount: DBUtils.vocabularies.length,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    );
  }
}
