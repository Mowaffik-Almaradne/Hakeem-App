import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class ReservationNowButtonWidget extends StatelessWidget {
  const ReservationNowButtonWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 130.w,
        height: 55.h,
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          left: 28.w,
        ),
        decoration: ShapeDecoration(
          color: AppColorManger.primaryColor.withOpacity(0.98),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.r),
          ),
        ),
        child: TextUtiels(
          text: text,
          fontFamily: AppFontFamily.extraBold,
          color: AppColorManger.white,
          fontSize: AppFontSizeManger.s18,
        ),
      ),
    );
  }
}
