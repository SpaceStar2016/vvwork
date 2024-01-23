import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class VvMarkdownText extends StatelessWidget {

  final String data;
  final TextStyle? baseStyle;
  final TextStyle? linkStyle;
  final void Function(String prompt)? onResend;

  const VvMarkdownText(
      this.data, {
        super.key,
        this.baseStyle = const TextStyle(color: Color(0xFFE6E6E8),fontSize: 46/3),
        this.linkStyle = const TextStyle(color: Color(0xFF06DCCF)),
        this.onResend,
      });

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: data,
      styleSheet: MarkdownStyleSheet(
        a: linkStyle,
        h1: baseStyle,
        h2: baseStyle,
        h3: baseStyle,
        h4: baseStyle,
        h5: baseStyle,
        h6: baseStyle,
        listBullet: baseStyle,
        p: baseStyle,
      ),
      onTapLink: (text, href, title) {
        if (href == null) return;
      },
    );
  }

}