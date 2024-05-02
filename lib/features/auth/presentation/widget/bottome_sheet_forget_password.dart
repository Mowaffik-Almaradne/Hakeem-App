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
import 'package:hosptel_app/core/widget/repeted/charater_city_widget.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/auth/presentation/widget/move_page_text_widget.dart';
import 'package:hosptel_app/router/app_router.dart';

class BottomeSheetForgetPasswordWidget extends StatelessWidget {
  const BottomeSheetForgetPasswordWidget({super.key});

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
                width: 20.w,
                height: 4.h,
                AppSvgManger.rowBottomeSheet,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextUtiels(
                text: AppWordManger.forgetPassword,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: AppFontSizeManger.s24,
                    ),
                paddingRight: 18.w,
              ),
            ),
            SizedBox(height: 39.h),
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
            SizedBox(height: 39.h),
            //? button for login :
            MainElevatedButton(
              horizontalPadding: 75.w,
              text: AppWordManger.sendCodeForEnsure,
              backgroundColor: AppColorManger.primaryColor,
              textColor: AppColorManger.white,
              onPreesed: () {
                Navigator.pushNamed(
                  context,
                  RouteNamedScreens
                      .forgetPasswordVerificationCodeScreenNameRoute,
                );
              },
            ),
            //? any account go to page regestir :
            MovPageText(
              movPageText: AppWordManger.login,
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  RouteNamedScreens.loginScreenNameRoute,
                );
              },
              primaryText: AppWordManger.accountAlradyFind,
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
