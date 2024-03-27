import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class LabelTypeGenderWidget extends StatelessWidget {
  const LabelTypeGenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 25.5.w, vertical: 18.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColorManger.grayNavButton,
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(18.r)),
        color: AppColorManger.white,
      ),
      child: TextUtiels(
        text: AppWordManger.gander,
        fontFamily: AppFontFamily.tajawalBold,
        color: AppColorManger.black,
        fontSize: AppFontSizeManger.s14,
      ),
    );
  }
}
