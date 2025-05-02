import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class CaptionTextWidget extends StatelessWidget {
  const CaptionTextWidget({super.key, required this.text, this.padding});
  final String text;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 19.w, vertical: 18.h),
        child: TextUtiels(
          fontFamily: AppFontFamily.tajawalBold,
          color: AppColorManger.primaryColor,
          text: text,
          fontSize: AppFontSizeManger.s24,
        ),
      ),
    );
  }
}
