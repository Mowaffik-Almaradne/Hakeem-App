import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class InfoDaysAndTimesWidget extends StatelessWidget {
  const InfoDaysAndTimesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105.h,
      child: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(height: 9.h),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUtiels(
                  text: '00:00_00:00',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: AppFontWeightManger.fontWeightSemiBold,
                      ),
                ),
                TextUtiels(
                  text: 'الأحد',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: AppFontWeightManger.fontWeightSemiBold,
                      ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
