import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/png_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/intro/presentation/widget/go_login_widget.dart';
import 'package:hosptel_app/router/app_router.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //? back Ground Image :
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppPngManger.backGroundIntro),
          ),
        ), //?
        child: Padding(
          padding: EdgeInsets.only(top: 250.w),
          child: Container(
            width: 390.w,
            height: 408.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.06.w, 1.10.h),
                end: Alignment(0.06.w, -1.5.h),
                colors: [
                  AppColorManger.black.withOpacity(0.6000000238418579),
                  AppColorManger.black.withOpacity(0.039000000804662704),
                  AppColorManger.black.withOpacity(0)
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //? Text Word :
                TextUtiels(
                  fontFamily: AppFontFamily.tajawalBold,
                  text: AppWordManger.easyBookingExperience,
                  color: AppColorManger.white,
                  fontSize: 24.sp,
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 17.5.w),
                  child: TextUtiels(
                    fontFamily: AppFontFamily.tajawalBold,
                    text: AppWordManger.medicalAppointments,
                    color: AppColorManger.white,
                    fontSize: AppFontSizeManger.s24,
                  ),
                ),

                TextUtiels(
                  fontFamily: 'TajawalRegular',
                  text: AppWordManger
                      .bookYourAppointmentNowAndEnjoyAUniqueExperience,
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 40.sp),
                  child: TextUtiels(
                    fontFamily: AppFontFamily.tajawalRegular,
                    text: AppWordManger.andSpecial,
                    color: AppColorManger.white,
                    fontSize: AppFontSizeManger.s16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                //?
                //? Image For move to page Login :
                Row(
                  children: [
                    GoLoginImageWidget(
                      onTap: () {
                        //? navigation to login screen :
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteNamedScreens.loginScreenNameRoute,
                          (route) => false,
                        );
                        //? animation to show BottomSheet :
                        // AnimationController controller = AnimationController(
                        //   vsync: Navigator.of(context),
                        //   duration: const Duration(
                        //     seconds: 2,
                        //   ),
                        // );

                        // showModalBottomSheet(
                        //   isDismissible: false,
                        //   enableDrag: true,
                        //   transitionAnimationController: controller,
                        //   isScrollControlled: false,
                        //   context: context,
                        //   builder: (context) {
                        //     return const BottomeSheetWidget();
                        //   },
                        // );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 5.h,
                      ),
                      child: SvgPicture.asset(
                        width: 130.w,
                        height: 80.h,
                        AppSvgManger.arrowIntroPage,
                      ),
                    ),
                  ],
                ), //?
              ],
            ),
          ),
        ),
      ),
    );
  }
}
