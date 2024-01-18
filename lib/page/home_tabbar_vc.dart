import 'package:flutter/material.dart';

class HomeTabBarVC extends DefaultTabController {
  // 构造方法
  const HomeTabBarVC({
    Key? key,
    required int length, // 选项卡的数量
    required Widget child, // 子部件
  }) : super(
          key: key,
          length: length,
          child: child,
        );
}
