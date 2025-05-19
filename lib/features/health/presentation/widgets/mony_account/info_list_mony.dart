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
      children: [
        TextUtiels(
          textDirection: TextDirection.rtl,
          text: "${item.amount.toString()} ل.س",
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontFamily: AppFontFamily.extraBold,
                fontSize: 20.sp,
              ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsetsDirectional.only(end: 14.w),
          child: Column(
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
                textDirection: TextDirection.rtl,
                text:
                    "${formatTimeTo12Hour(item.creationTime)} ${amAndPm(item.creationTime)}",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 14.sp,
                      color: AppColorManger.textGray,
                    ),
              ),
            ],
          ),
        ),
        //? Icon :
        Container(
          width: 23.66.w,
          height: 25.81.h,
          decoration: BoxDecoration(
            color: AppColorManger.secoundryColor,
            borderRadius: BorderRadius.circular(5.r),
          ),
        )
      ],
    );
  }
}
