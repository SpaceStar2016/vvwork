import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: InkWell(
        onTap: () {
          // 处理按钮点击事件
          print('Add button tapped!');
        },
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.blue,
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
    );
  }
}
