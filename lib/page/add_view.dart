import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:vvword/Utils/UIUtils.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/addPage');
            },
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: UIUtils.themeBlue,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          const SizedBox(height: 5,),
          // const Text("点击添加你的词汇", style: TextStyle(
          //   color: Colors.grey
          // ),)
        ],
      ),
    );
  }
}
