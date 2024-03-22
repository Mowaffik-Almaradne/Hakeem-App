import 'package:flutter/material.dart';
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
import 'package:hosptel_app/router/app_router.dart';

class BottomeSheetWidget extends StatelessWidget {
  const BottomeSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 310.h),
        decoration: BoxDecoration(
          color: AppColorManger.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60.w,
                  height: 60.h,
                  padding: EdgeInsets.symmetric(vertical: 22.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColorManger.primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextUtiels(
                    text: '+963',
                    color: AppColorManger.white,
                    fontWeight: AppFontWeightManger.fontWeightRagular,
                    fontSize: AppFontSizeManger.s13,
                  ),
                ),
                //? filed mobile phone :
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.h,
                    left: 10.w,
                  ),
                  child: MainTextFormFiled(
                    hintText: AppWordManger.pleaseEnterYourPhoneNumber,
                    onChange: (value) {},
                    textInputType: TextInputType.phone,
                    filedWidth: 220,
                    filedHeight: 60,
                    contentPaddingVertical: 15.h,
                    contentPaddingHorizontal: 27.w,
                  ),
                ),
              ],
            ),
            //? filed  Paswword :
            Padding(
              padding: EdgeInsets.only(
                top: 10.h,
              ),
              child: TextFormFiledPassword(
                hintText: AppWordManger.password,
                onChange: (value) {},
                textInputType: TextInputType.visiblePassword,
                filedWidth: 285,
                filedHeight: 60,
              ),
            ),

            SizedBox(height: 5.h),
            //? forget password :
            Padding(
              padding: EdgeInsets.only(left: 160.w, bottom: 13.h),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, RouteNamedScreens.forgetPasswordScreenNameRoute);
                },
                child: TextUtiels(
                  text: AppWordManger.forgotYourPassword,
                  color: AppColorManger.primaryColor,
                  fontSize: AppFontSizeManger.s9,
                  fontWeight: AppFontWeightManger.fontWeightRagularBold,
                ),
              ),
            ),

            //? button for login :
            MainElevatedButton(
              text: AppWordManger.login,
              backgroundColor: AppColorManger.primaryColor,
              textColor: AppColorManger.white,
              onPreesed: () {
                Navigator.pushReplacementNamed(
                    context, RouteNamedScreens.homeScreenNameRoute);
              },
            ),
            //? any account go to page regestir :
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, RouteNamedScreens.signUpScreenNameRoute);
                  },
                  child: TextUtiels(
                    text: AppWordManger.createAccount,
                    fontWeight: AppFontWeightManger.fontWeightRagularBold,
                    color: AppColorManger.primaryColor,
                    fontSize: AppFontSizeManger.s10,
                    height: 4.h,
                  ),
                ),
                SizedBox(width: 8.w),
                TextUtiels(
                  text: AppWordManger.dontHaveAnAccountAlreadyPlease,
                  fontWeight: AppFontWeightManger.fontWeightRagularBold,
                  color: AppColorManger.fillBlack,
                  fontSize: AppFontSizeManger.s10,
                ),
              ],
            ),
            SizedBox(
              height: 200.h,
            )
          ],
        ),
      ),
    );
  }
}
