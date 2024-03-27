import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class LabelTextFormFiled extends StatelessWidget {
  const LabelTextFormFiled({
    super.key,
    required this.text,
    required this.paddingTop,
  });
  final String text;
  final double paddingTop;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.only(top: paddingTop.h, right: 51.w),
      child: TextUtiels(
        fontFamily: AppFontFamily.tajawalRegular,
        text: text,
        color: AppColorManger.black,
        fontSize: AppFontSizeManger.s13,
      ),
    );
  }
}
