import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtiels extends StatelessWidget {
  const TextUtiels({
    super.key,
    required this.text,
    this.style,
    this.fontWeight,
    this.textColor,
  });
  final String text;
  final TextStyle? style;
  final FontWeight? fontWeight;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          GoogleFonts.tajawal(
            fontSize: 16.sp,
            fontWeight: fontWeight,
            color: textColor,
          ),
    );
  }
}
