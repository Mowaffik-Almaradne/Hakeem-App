import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/class/clipping_path_class.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/png_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class AppBarReservationDetailsWidget extends StatelessWidget {
  const AppBarReservationDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClippingClass(),
      child: Container(
        width: double.infinity,
        height: 143.h,
        decoration: BoxDecoration(
          color: AppColorManger.primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: SvgPicture.asset(
                  width: 25.w,
                  height: 25.h,
                  colorFilter:
                      ColorFilter.mode(AppColorManger.white, BlendMode.srcIn),
                  AppSvgManger.iconArrow,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              //? If Not Use Is GUST :
              child: Visibility(
                visible: AppSharedPreferences.getToken().isNotEmpty,
                replacement: TextUtiels(
                  text: AppWordManger.pleaseLoginForGetFeatureMoreAndBetter,
                  fontSize: 11.7.sp,
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextUtiels(
                          text: AppSharedPreferences.getUserName(),
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 13.sp,
                                  ),
                        ),
                        TextUtiels(
                          text: AppWordManger.welcomBack,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 15.sp,
                                  ),
                        ),
                      ],
                    ),
                    Container(
                      width: 40.w,
                      height: 40.h,
                      margin: EdgeInsetsDirectional.only(start: 8.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            color: AppColorManger.balckCheck.withOpacity(0.09),
                            offset: const Offset(0, 2),
                          )
                        ],
                        image: const DecorationImage(
                          image: AssetImage(AppPngManger.iconApp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
