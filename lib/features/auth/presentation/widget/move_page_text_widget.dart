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
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            child: TextUtiels(
              text: movPageText,
              paddingTop: 2.h,
              paddingRight: 7.w,
              style: TextStyle(
                fontFamily: AppFontFamily.tajawalLight,
                color: AppColorManger.primaryColor,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextUtiels(
            fontFamily: AppFontFamily.tajawalLight,
            text: primaryText,
            color: AppColorManger.primaryColor,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 10.sp,
                  decorationStyle: TextDecorationStyle.solid,
                ),
          ),
        ],
      ),
    );
  }
}
