import 'package:flutter/material.dart';

class TextUtiels extends StatelessWidget {
  const TextUtiels({
    super.key,
    required this.text,

    required this.color,
    required this.fontSize,
    required this.fontFamily,
    this.textAlign,
    this.shadows,
    this.height,
  });
  final String text;
  final String fontFamily;
  final Color color;
  final double fontSize;
  final TextAlign? textAlign;
  final List<Shadow>? shadows;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign ?? TextAlign.end,
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: color,
        shadows: shadows,
        height: height,
      ),
      overflow: TextOverflow.visible,
    );
  }
}
