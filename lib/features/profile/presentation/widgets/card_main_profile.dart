import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class CardMainProfile extends StatelessWidget {
  const CardMainProfile({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Container(
          width: 318.w,
          height: 75.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColorManger.white,
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: AppColorManger.colorBox,
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 11.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                width: 25.w,
                height: 25.h,
                AppSvgManger.iconArrowProfile,
              ),
              TextUtiels(
                text: text,
                fontFamily: AppFontFamily.extraBold,
                color: AppColorManger.black,
                fontSize: 14.5.sp,
                paddingLeft: 150,
              ),
              SvgPicture.asset(
                width: 25.w,
                height: 25.h,
                AppSvgManger.iconCircularProfile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
