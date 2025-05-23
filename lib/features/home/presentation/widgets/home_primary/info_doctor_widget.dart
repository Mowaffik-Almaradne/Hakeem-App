import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class InfoDoctor extends StatelessWidget {
  const InfoDoctor({super.key, required this.text, required this.icon});
  final String text;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.h),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 12.h,
      ),
      width: 120.w,
      height: 42.h,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: const Alignment(-0.03, -1.00),
          end: const Alignment(0.01, 1.2),
          colors: [
            AppColorManger.colorLinear,
            AppColorManger.primaryColor.withOpacity(0.6)
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        children: [
          TextUtiels(
            paddingLeft: 2.w,
            text: text,
            fontFamily: AppFontFamily.tajawalBold,
            fontSize: AppFontSizeManger.s12,
            color: AppColorManger.secoundryColor,
          ),
          const Spacer(),
          SvgPicture.asset(
            width: 12.w,
            height: 18.h,
            icon,
          )
        ],
      ),
    );
  }
}
