import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class CharacterNumberWidget extends StatelessWidget {
  const CharacterNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 60.h,
      padding: EdgeInsets.symmetric(vertical: 22.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColorManger.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextUtiels(
        text: AppWordManger.characterCity,
        fontFamily: AppFontFamily.tajawalMedium,
        color: AppColorManger.white,
        fontSize: AppFontSizeManger.s13,
      ),
    );
  }
}
