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
        alignment: Alignment.center,
        width: 125.w,
        height: 60.h,
        margin: EdgeInsets.only(left: 28.w),
        padding: EdgeInsets.symmetric(vertical: 15.h),
        decoration: ShapeDecoration(
          color: AppColorManger.primaryColor.withOpacity(0.98),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: TextUtiels(
            text: text,
            color: AppColorManger.white,
            fontSize: AppFontSizeManger.s18,
            fontWeight: AppFontWeightManger.fontWeightExtraBold),
      ),
    );
  }
}
