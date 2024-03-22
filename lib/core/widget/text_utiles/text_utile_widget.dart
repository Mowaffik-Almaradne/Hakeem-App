import 'package:flutter/material.dart';

class TextUtiels extends StatelessWidget {
  const TextUtiels({
    super.key,
    required this.text,
    this.style,
    required this.fontWeight,
    required this.color,
    required this.fontSize,
    this.textAlign,
    this.shadows,
    this.height,
  });
  final String text;
  final TextStyle? style;
  final FontWeight fontWeight;
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
        fontFamily: 'Tajawal',
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        shadows: shadows,
        height: height,
      ),
      overflow: TextOverflow.visible,
    );
  }
}
