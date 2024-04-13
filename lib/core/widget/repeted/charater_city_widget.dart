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
        top: 16.h,
        bottom: 12.h,
        left: 13.w,
        right: 13.w,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColorManger.primaryColor,
        borderRadius: BorderRadius.circular(18).r,
      ),
      child: TextUtiels(
        text: AppWordManger.characterCity,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 15.sp,
              fontWeight: AppFontWeightManger.fontWeightBold,
            ),
      ),
    );
  }
}
