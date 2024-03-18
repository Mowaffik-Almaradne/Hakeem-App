import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/png_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/main/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/main/main_app_bar/main_app_bar.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/home/presentation/widgets/caption_text_widget.dart';
import 'package:hosptel_app/features/home/presentation/widgets/info_doctor_widget.dart';
import 'package:hosptel_app/features/home/presentation/widgets/info_services_widget.dart';
import 'package:hosptel_app/features/home/presentation/widgets/info_tipa_news_widget.dart';
import 'package:hosptel_app/features/home/presentation/widgets/reservation_now_button_widget.dart';
import 'package:stroke_text/stroke_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      appBar: CustomAppBar(
        flexibleSpace: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                //? this is image api :
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(
                    'assets/image/png/bacgroundDoctor.png',
                  ),
                ),
              ),
            ),
            //? layer 1 one :
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  opacity: 0.5,
                  image: AssetImage(AppPngManger.layerShadow),
                ),
              ),
            ),
            //? layer 2 tow :
            Container(
              padding: EdgeInsets.only(bottom: 25.h),
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  opacity: 0.2,
                  image: AssetImage(
                    AppPngManger.layerShadow,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //? api this text not static :
                    StrokeText(
                      text: "د. علي محمد",
                      textStyle: TextStyle(
                        fontSize: 25.sp,
                        color: AppColorManger.white,
                      ),
                      strokeColor: AppColorManger.secoundryColor,
                      strokeWidth: 4.2,
                      textColor: AppColorManger.white,
                    ),
                    //? api this text not static :
                    TextUtiels(
                      text: 'اخصائي في الجراحة التجميلية',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: AppColorManger.offWhite,
                            fontSize: AppFontSizeManger.s12,
                            fontWeight: AppFontWeightManger.fontWeightRagular,
                          ),
                    ),
                    SizedBox(height: 9.h),
                    //? api this text not static :
                    const InfoDoctor(
                      icon: AppSvgManger.iconPhone,
                      text: '0935059787',
                    ),
                    SizedBox(height: 6.5.h),
                    const InfoDoctor(
                      icon: AppSvgManger.iconLocation,
                      text: 'دمشق _المزة',
                    ),
                  ],
                ),
              ),
            ),
            //?
          ],
        ),
        hieghtAppbar: 250.h,
      ),
      mainBody: SingleChildScrollView(
        child: Column(
          children: [
            //? button reservation Now :
            const ReservationNowButtonWidget(
              text: AppWordManger.reservationNow,
            ),
            SizedBox(height: 15.h),
            //? about doctor label :
            const CaptionTextWidget(
              text: AppWordManger.aboutDoctor,
            ),
            SizedBox(height: 18.h),
            //? about doctor text <Api>:
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 5.h),
              child: TextUtiels(
                text: AppWordManger.textVisible,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: AppColorManger.textColor,
                      fontSize: AppFontSizeManger.s13,
                      fontWeight: AppFontWeightManger.fontWeightRagular,
                      height: 1.5.h,
                    ),
              ),
            ),
            SizedBox(height: 18.h),
            const CaptionTextWidget(
              text: AppWordManger.services,
            ),
            //? api this is :
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: const InfoServicesWidget(),
            ),
            //?
            const CaptionTextWidget(
              text: AppWordManger.tipsAndNews,
            ),
            SizedBox(height: 18.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: const InfoTipasNewsWidget(),
            ),
            SizedBox(height: 60.h)
          ],
        ),
      ),
    );
  }
}
