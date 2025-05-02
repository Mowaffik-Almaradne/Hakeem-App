import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class EmptyTextWidget extends StatelessWidget {
  const EmptyTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextUtiels(
      paddingBottome: 5.h,
      paddingTop: 5.h,
      maxLines: 2,
      fontFamily: AppFontFamily.tajawalLight,
      textAlign: TextAlign.center,
      text: text,
      color: AppColorManger.textServices,
      fontWeight: FontWeight.w700,
      fontSize: AppFontSizeManger.s13,
      height: 1.5.h,
    );
  }
}
