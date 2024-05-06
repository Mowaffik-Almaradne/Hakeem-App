import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class InfoDayWidget extends StatelessWidget {
  const InfoDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20.h,
      ),
      child: SizedBox(
        height: 63.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          reverse: false,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          itemCount: 10,
          separatorBuilder: (context, index) => SizedBox(width: 11.w),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: AppColorManger.white,
                border: Border.all(
                  color: AppColorManger.primaryColor,
                  width: 2.w,
                ),
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 8.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextUtiels(
                      paddingBottome: 5.h,
                      text: 'اليوم',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: 10.sp,
                            fontWeight: AppFontWeightManger.fontWeightSemiBold,
                          ),
                    ),
                    TextUtiels(
                      text: 'سبتمبر 7',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 11.sp,
                            fontWeight: AppFontWeightManger.fontWeightExtraBold,
                          ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
