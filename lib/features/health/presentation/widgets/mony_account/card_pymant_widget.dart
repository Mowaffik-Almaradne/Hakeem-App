import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class CardPymantWidget extends StatelessWidget {
  const CardPymantWidget({
    super.key,
    required this.costAccount,
    this.margin,
    required this.mainText,
  });
  final String costAccount;
  final String mainText;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(top: 14.h),
      padding: EdgeInsets.symmetric(vertical: 16.42.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColorManger.fillColorCard,
        border: Border.all(
          color: AppColorManger.primaryColor,
          width: 1.2.w,
        ),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Align(
                child: TextUtiels(
                  text: 'ل.س',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontFamily: AppFontFamily.extraBold,
                        fontSize: 20.sp,
                      ),
                ),
              ),
              TextUtiels(
                text: costAccount,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontFamily: AppFontFamily.extraBold,
                      fontSize: 20.sp,
                    ),
              ),
            ],
          ),
          TextUtiels(
            paddingLeft: 15.w,
            text: mainText,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontSize: 16.sp,
                color: AppColorManger.textColor2,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
