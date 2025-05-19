import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/function/helper_function.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_avaliable_time.dart';

class InfoTimeItemWidget extends StatelessWidget {
  const InfoTimeItemWidget({
    super.key,
    required this.item,
    this.fromTimeTextColor,
    this.backGroundColor,
    this.borderColor,
    this.onTap,
  });
  final AvailableTime item;
  final Color? fromTimeTextColor;
  final Color? backGroundColor;
  final void Function()? onTap;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backGroundColor,
          border: Border.all(
            color: borderColor ?? AppColorManger.primaryColor,
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextUtiels(
                text: getTimePeriod(time: item.fromTime),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 11.sp,
                      fontWeight: AppFontWeightManger.fontWeightExtraBold,
                      color: fromTimeTextColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
