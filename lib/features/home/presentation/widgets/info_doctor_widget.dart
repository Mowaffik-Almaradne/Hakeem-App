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
    return Opacity(
      opacity: 0.98,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        width: 120.w,
        height: 51.h,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: const Alignment(-0.03, -1.00),
            end: const Alignment(0.01, 1.2),
            colors: [
              AppColorManger.colorLinear,
              AppColorManger.white.withOpacity(0)
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextUtiels(
              text: text,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: AppFontSizeManger.s13,
                    color: AppColorManger.secoundryColor,
                    fontWeight: AppFontWeightManger.fontWeightBold,
                  ),
            ),
            SizedBox(width: 8.w),
            SvgPicture.asset(
              width: 12.w,
              height: 18.h,
              icon,
            )
          ],
        ),
      ),
    );
  }
}
