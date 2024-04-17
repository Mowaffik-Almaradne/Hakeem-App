import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/form_filed/main_form_filed.dart';
import 'package:hosptel_app/core/widget/repeted/charater_city_widget.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/core/widget/form_filed/text_form_filed_pasword_widget.dart';
import 'package:hosptel_app/features/auth/presentation/widget/move_page_text_widget.dart';
import 'package:hosptel_app/router/app_router.dart';

class BottomeSheetLoginWidget extends StatelessWidget {
  const BottomeSheetLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColorManger.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 28.h,
              ),
              child: SvgPicture.asset(
                width: 72.w,
                height: 5.h,
                AppSvgManger.rowBottomeSheet,
              ),
            ),
            SizedBox(height: 28.h),
            //? filed mobile phone :
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CharacterCityWidget(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.h,
                    left: 10.w,
                  ),
                  child: MainTextFormFiled(
                    hintText: AppWordManger.pleaseEnterYourPhoneNumber,
                    onChange: (value) {},
                    textInputType: TextInputType.phone,
                    filedWidth: 200.w,
                    filedHeight: 60.h,
                    contentPaddingVertical: 13.h,
                    contentPaddingHorizontal: 27.w,
                    inputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(8),
                    ],
                  ),
                ),
              ],
            ),
            //? filed  Paswword :
            Padding(
              padding: EdgeInsets.only(
                top: 20.h,
              ),
              child: TextFormFiledPassword(
                hintText: AppWordManger.password,
                onChange: (value) {},
                textInputType: TextInputType.visiblePassword,
                filedWidth: 275,
                filedHeight: 60,
              ),
            ),

            SizedBox(height: 5.h),
            //? forget password :
            Padding(
              padding: EdgeInsets.only(left: 160.r, bottom: 13.h),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNamedScreens.forgetPasswordScreenNameRoute,
                  );
                },
                child: TextUtiels(
                  text: AppWordManger.forgotYourPassword,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 10.sp,
                      ),
                ),
              ),
            ),

            //? button for login :
            MainElevatedButton(
              text: AppWordManger.login,
              backgroundColor: AppColorManger.primaryColor,
              textColor: AppColorManger.white,
              onPreesed: () {
                Navigator.pushNamed(
                  context,
                  RouteNamedScreens.reciveNumberVerificationPageScreenNameRoute,
                );
              },
            ),
            //? any account go to page regestir :
            MovPageText(
              movPageText: AppWordManger.createAccount,
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  RouteNamedScreens.signUpScreenNameRoute,
                );
              },
              primaryText: AppWordManger.dontHaveAnAccountAlreadyPlease,
            ),

            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}
