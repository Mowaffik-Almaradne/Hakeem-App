import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/widget/main/main_app_bar/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class PostionDoctorPage extends StatelessWidget {
  const PostionDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      backgroundColor: AppColorManger.offWhite,
      mainBody: const Text("ss"),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        width: double.infinity,
        height: 180.26.h,
        decoration: BoxDecoration(
          color: AppColorManger.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //? Name Doctor  :
                  TextUtiels(
                    text: "الدكتور محمد علي",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColorManger.black,
                          fontSize: 16.sp,
                          fontWeight: AppFontWeightManger.fontWeightExtraBold,
                        ),
                  ),
                  //? Postion  :
                  TextUtiels(
                    text: "المزة",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColorManger.pinColorFiled,
                          fontSize: 16.sp,
                          fontWeight: AppFontWeightManger.fontWeightExtraBold,
                        ),
                  ),
                ],
              ),
            ),
            //? Icon :
            SvgPicture.asset(
              width: 16.w,
              height: 20.h,
              AppSvgManger.iconMap,
            ),
          ],
        ),
      ),
    );
  }
}
