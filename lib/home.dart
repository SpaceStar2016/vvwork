import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title, super.key});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "https://via.placeholder.com/350x150",
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
        pagination: SwiperPagination(),
        control: SwiperControl(),
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  HomeContent({required this.title, super.key});

  final String title;

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
