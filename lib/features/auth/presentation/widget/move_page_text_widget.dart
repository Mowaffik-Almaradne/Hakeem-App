import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class MovPageText extends StatelessWidget {
  const MovPageText({
    super.key,
    required this.onTap,
    required this.movPageText,
    required this.primaryText,
  });
  final void Function() onTap;
  final String movPageText;
  final String primaryText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: TextUtiels(
            text: movPageText,
            fontFamily: AppFontFamily.tajawalLight,
            color: AppColorManger.primaryColor,
            fontSize: AppFontSizeManger.s10,
            height: 4.h,
          ),
        ),
        SizedBox(width: 8.w),
        TextUtiels(
          fontFamily: AppFontFamily.tajawalLight,
          text: primaryText,
          color: AppColorManger.fillBlack,
          fontSize: AppFontSizeManger.s10,
        ),
      ],
    );
  }
}
