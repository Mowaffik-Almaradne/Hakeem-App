import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/form_filed/main_form_filed.dart';
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
                Container(
                  padding: EdgeInsets.only(
                    top: 18.h,
                    bottom: 15.h,
                    left: 14.w,
                    right: 14.w,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColorManger.primaryColor,
                    borderRadius: BorderRadius.circular(13).w,
                  ),
                  child: TextUtiels(
                    text: AppWordManger.characterCity,
                    color: AppColorManger.white,
                    fontFamily: AppFontFamily.tajawalMedium,
                    fontSize: AppFontSizeManger.s13,
                  ),
                ),
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
                    contentPaddingHorizontal: 25.w,
                    inputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
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
                  Navigator.pushReplacementNamed(
                      context, RouteNamedScreens.forgetPasswordScreenNameRoute);
                },
                child: TextUtiels(
                  fontFamily: AppFontFamily.tajawalRegular,
                  text: AppWordManger.forgotYourPassword,
                  color: AppColorManger.primaryColor,
                  fontSize: AppFontSizeManger.s9,
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
