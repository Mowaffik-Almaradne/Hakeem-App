import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class CharacterCityWidget extends StatelessWidget {
  const CharacterCityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 18.h,
        bottom: 15.h,
        left: 14.w,
        right: 14.w,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColorManger.primaryColor,
        borderRadius: BorderRadius.circular(13).w,
      ),
      child: TextUtiels(
        text: AppWordManger.characterCity,
        color: AppColorManger.white,
        fontFamily: AppFontFamily.tajawalMedium,
        fontSize: AppFontSizeManger.s13,
      ),
    );
  }
}
