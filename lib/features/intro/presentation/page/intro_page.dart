import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hosptel_app/core/function/helper_function.dart';
import 'package:hosptel_app/core/function/shadow_function.dart';
import 'package:hosptel_app/core/resources/png_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/auth/presentation/widget/bottome_sheet_widget.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //? Text Word :
              TextUtiels(
                text: AppWordManger.easyBookingExperience,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(shadows: [
                  shadowText(blurRadius: 2.0, offset: const Offset(2.0, 2.0))
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 17.5.w),
                child: TextUtiels(
                  text: AppWordManger.medicalAppointments,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(shadows: [
                    shadowText(blurRadius: 1.5, offset: const Offset(2.0, 2.0))
                  ]),
                ),
              ),
              TextUtiels(
                text: AppWordManger
                    .bookYourAppointmentNowAndEnjoyAUniqueExperience,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(shadows: [
                  shadowText(blurRadius: 1.5, offset: const Offset(1.0, 1.0))
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40.sp),
                child: TextUtiels(
                  text: AppWordManger.andSpecial,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(shadows: [
                    shadowText(blurRadius: 1.5, offset: const Offset(1.0, 1.0))
                  ]),
                ),
              ), //?
              //? Image For move to page Login :
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GoLoginImageWidget(
                    onTap: () {
                      //? navigation to login screen :
                      navigationPage(
                        context,
                        page: RouteNamedScreens.loginScreenNameRoute,
                      );
                      //? animation to show BottomSheet :
                      AnimationController controller = AnimationController(
                        vsync: Navigator.of(context),
                        duration: const Duration(
                          seconds: 2,
                        ),
                      );

                      showModalBottomSheet(
                        isDismissible: false,
                        enableDrag: true,
                        transitionAnimationController: controller,
                        context: context,
                        builder: (context) {
                          return const BottomeSheetWidget();
                        },
                      );
                    },
                  ),
                  SvgPicture.asset(
                    width: 100.w,
                    height: 110.h,
                    AppSvgManger.arrowIntroPage,
                  )
                ],
              ), //?
            ],
          ),
        ),
      ),
    );
  }
}
