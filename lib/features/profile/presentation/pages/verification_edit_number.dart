import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/form_filed/text_form_filed_verification_code.dart';
import 'package:hosptel_app/core/widget/main/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/auth/presentation/widget/move_page_text_widget.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/bacground_profile.dart';
import 'package:hosptel_app/router/app_router.dart';

class VerficationEditNumber extends StatelessWidget {
  const VerficationEditNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: SingleChildScrollView(
        child: Column(
          children: [
            //? Back Ground Verification My Number :
            const BackGroundProfile(
              textBackGround: AppWordManger.editMyNumber,
            ),
            SizedBox(height: 30.h),
            Align(
              alignment: Alignment.centerRight,
              child: TextUtiels(
                paddingRight: 17.w,
                paddingBottome: 11.h,
                text: AppWordManger.writeNumber,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 22.sp,
                    ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextUtiels(
                paddingRight: 17.w,
                paddingBottome: 18.h,
                text: AppWordManger.aCodeisSentViaTextMessageTo,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
            ),
            //?Api :
            Align(
              alignment: Alignment.centerRight,
              child: TextUtiels(
                paddingBottome: 3.h,
                text: '+963 935049855',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 16.sp,
                    ),
                paddingRight: 18.w,
              ),
            ),
            //? Edit Number :
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteNamedScreens.editNumberNameRoute,
                  );
                },
                child: TextUtiels(
                  text: AppWordManger.editNumber,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 16.sp,
                      ),
                  paddingRight: 18.w,
                  paddingBottome: 30.h,
                ),
              ),
            ),
            //? Filed For Verfication Code :
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextFormFiledVerficationCodeWidget(
                  onChanged: (value) {},
                ),
                TextFormFiledVerficationCodeWidget(
                  onChanged: (value) {},
                ),
                TextFormFiledVerficationCodeWidget(
                  onChanged: (value) {},
                ),
                TextFormFiledVerficationCodeWidget(
                  onChanged: (value) {},
                )
              ],
            ),
            SizedBox(height: 59.h),
            //? Button For sure character :
            MainElevatedButton(
              horizontalPadding: 90.w,
              verticalPadding: 11.h,
              text: AppWordManger.codeNumber,
              backgroundColor: AppColorManger.secoundryColor,
              textColor: AppColorManger.white,
              onPreesed: () {
                Navigator.pushNamed(
                  context,
                  RouteNamedScreens.profileNameRoute,
                );
              },
            ),
            //? Dont Recive Any Code Number :
            MovPageText(
              movPageText: AppWordManger.resendMessage,
              onTap: () {},
              primaryText: AppWordManger.dontGetVerificationCode,
            ),
          ],
        ),
      ),
    );
  }
}
