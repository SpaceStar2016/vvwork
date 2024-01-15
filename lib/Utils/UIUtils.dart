import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class UIUtils {

  // 主题背景白
  static const Color themeBackground = Color(0xFFEDF4F7);
  // 主题蓝
  static const Color themeBlue = Color(0xFF6696FF);

  static const Color themeGrey = Color(0xFFC4CACD);
  // 文字白
  static const Color themeCharacterWhite = Color(0xFFFFFFFF);
  // 文字黑
  static const Color themeCharacterBlack = Color(0xFF383C47);

  // palceHolder 的颜色
  static const Color themeCharacterHint = Color(0xFF7C7C7C);

}

class VvWordAppBar extends AppBar {
  static const TextStyle titleStyle = TextStyle(
    color: Color(0xFF333333),
    fontSize: 48 / 3,
    fontWeight: FontWeight.w600,
  );
  VvWordAppBar(
      {super.key,
        SystemUiOverlayStyle systemOverlayStyle = SystemUiOverlayStyle.dark,
        Widget? leading,
        double? leadingWidth,
        Widget? title,
        Color backgroundColor = Colors.transparent,
        Color shadowColor = Colors.transparent,
        List<Widget>? actions})
      : super(
    systemOverlayStyle: systemOverlayStyle,
    leading: leading,
    leadingWidth: leadingWidth,
    backgroundColor: backgroundColor,
    shadowColor: shadowColor,
    title: title,
    actions: actions,
  );
}

class CustomBackButton extends StatelessWidget {

  static double leadingWidth = 24 + 20;

  final Widget icon;
  final VoidCallback? onPressed;
  final ButtonStyle style;

  CustomBackButton({
    super.key,
    ButtonStyle? style,
    Widget? icon,
    this.onPressed
  }) : icon = icon ?? Png.name('mine_account_close', width: 24),
        style = style ?? IconButton.styleFrom(minimumSize: Size.zero, padding: EdgeInsets.zero,);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      style: style,
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.pop(context);
        }
      },
    );
  }
}

extension Png on Image {
  static Image name(String name, {Key? key, double? width, double? height, double? scale, Rect? centerSlice, Color? color, BoxFit? fit, ImageErrorWidgetBuilder? errorBuilder}) {
    return Image.asset('assets/images/$name.png',
        key: key,
        width: width,
        height: height,
        scale: scale,
        centerSlice: centerSlice,
        color: color,
        fit: fit ?? BoxFit.cover,
        errorBuilder: errorBuilder
    );
  }
}