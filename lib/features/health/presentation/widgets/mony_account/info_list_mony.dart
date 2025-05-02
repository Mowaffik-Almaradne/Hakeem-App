import 'package:hosptel_app/features/health/domain/entities/res/accounts_for_patient_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/function/helper_function.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class InfoItemDetailsMonyAccount extends StatelessWidget {
  const InfoItemDetailsMonyAccount({super.key, required this.item});
  final AccountsForPatientItem item;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                text: item.amount.toString(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontFamily: AppFontFamily.extraBold,
                      fontSize: 20.sp,
                    ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextUtiels(
              text: ' ${formatDate(item.creationTime, slasheFormate: true)}',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 14.sp,
                    color: AppColorManger.textGray,
                  ),
            ),
            TextUtiels(
              text: formatTimeTo12Hour(item.creationTime),
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 14.sp,
                    color: AppColorManger.textGray,
                  ),
            ),
          ],
        ),
        //? Icon :
        Container(
          width: 26.w,
          height: 30.h,
          decoration: BoxDecoration(
            color: AppColorManger.secoundryColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
        )
      ],
    );
  }
}
