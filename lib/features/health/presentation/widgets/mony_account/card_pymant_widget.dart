import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/health/domain/entities/res/accounts_for_patient_entities.dart';

class CardPymantWidget extends StatelessWidget {
  const CardPymantWidget({super.key, required this.entity, this.margin});
  final AccountsForPatientResult entity;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(top: 14.h),
      width: 318.w,
      height: 78.h,
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
          TextUtiels(
            paddingLeft: 15.w,
            text: AppWordManger.donePymant,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontSize: 16.sp, color: AppColorManger.lightText),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                TextUtiels(
                  text: 'ل.س',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontFamily: AppFontFamily.extraBold,
                        fontSize: 20.sp,
                      ),
                ),
                TextUtiels(
                  text: entity.deptTotalAmount.toString(),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontFamily: AppFontFamily.extraBold,
                        fontSize: 20.sp,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
