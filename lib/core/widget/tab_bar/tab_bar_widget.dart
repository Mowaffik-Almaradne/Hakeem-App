import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key, this.onTap});
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        height: 55.h,
        decoration: BoxDecoration(
          color: AppColorManger.fillColorCard,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: TabBar(
          onTap: onTap,
          dividerColor: Colors.transparent,
          automaticIndicatorColorAdjustment: true,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: AppColorManger.colorShowDailogButton,
          labelColor: AppColorManger.primaryColor,
          indicatorColor: AppColorManger.white,
          indicatorWeight: 0,
          indicator: BoxDecoration(
            color: AppColorManger.colorButtonShowDailog,
            borderRadius: BorderRadius.circular(10.r),
          ),
          labelStyle: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 16.sp,
              ),
          tabs: const [
            Tab(text: AppWordManger.finshied),
            Tab(text: AppWordManger.watting),
          ],
        ),
      ),
    );
  }
}
