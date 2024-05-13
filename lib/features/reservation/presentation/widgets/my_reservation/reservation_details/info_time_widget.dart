import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class InfoTimesWidget extends StatelessWidget {
  const InfoTimesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20.h,
      ),
      child: SizedBox(
        height: 50.h,
        child: ListView.separated(
          reverse: true,
          scrollDirection: Axis.horizontal,
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
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtiels(
                      paddingBottome: 5.h,
                      text: 'مساء',
                      paddingTop: 2.h,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 10.sp,
                            fontWeight: AppFontWeightManger.fontWeightExtraBold,
                          ),
                    ),
                    TextUtiels(
                      text: '7:00 ',
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
