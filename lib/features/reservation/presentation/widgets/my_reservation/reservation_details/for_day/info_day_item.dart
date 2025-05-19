import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/function/helper_function.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_available_days.dart';

class InfoDayItem extends StatelessWidget {
  const InfoDayItem({
    super.key,
    required this.item,
    this.onTap,
    this.backGroundColor,
    this.fontColorDay,
    this.fontColorData,
  });
  final AvailableDays item;
  final Color? backGroundColor;
  final Color? fontColorDay;
  final Color? fontColorData;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backGroundColor ?? AppColorManger.white,
          border: Border.all(
            color: AppColorManger.primaryColor,
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 8.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //? Text Name :
              TextUtiels(
                paddingBottome: 5.h,
                text: item.name,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: 10.sp,
                      fontWeight: AppFontWeightManger.fontWeightSemiBold,
                      color: fontColorDay,
                    ),
              ),
              //? Text Data :
              TextUtiels(
                text: "${getMonthName(date: item.date)} ${item.date.day}",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 11.sp,
                    fontWeight: AppFontWeightManger.fontWeightExtraBold,
                    color: fontColorData),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
