import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/auth/presentation/widget/move_page_text_widget.dart';
import 'package:hosptel_app/features/auth/presentation/widget/text_form_filed_verification_code.dart';
import 'package:hosptel_app/router/app_router.dart';

class BottomeSheetVerifivcationWidget extends StatelessWidget {
  const BottomeSheetVerifivcationWidget({
    super.key,
    required this.subText,
    required this.fontSizeSubText,
    required this.fontColorSubText,
    required this.fontFamailySubText,
  });
  final String subText;
  final double fontSizeSubText;
  final Color fontColorSubText;
  final String fontFamailySubText;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: 390.h,
        ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //? icon back page :
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 18.w),
                    child: SvgPicture.asset(
                      width: 30.w,
                      height: 30.h,
                      AppSvgManger.iconArrow,
                    ),
                  ),
                ),
                //? text for number :
                TextUtiels(
                  text: AppWordManger.writeNumber,
                  color: AppColorManger.primaryColor,
                  fontSize: AppFontSizeManger.s24,
                  fontFamily: AppFontFamily.tajawalBold,
                  paddingRight: 18.w,
                ),
              ],
            ),
            //? Number from Api :
            Align(
              alignment: Alignment.centerRight,
              child: TextUtiels(
                text: subText,
                color: fontColorSubText,
                fontSize: fontSizeSubText,
                fontFamily: fontFamailySubText,
                paddingTop: 39.h,
                paddingRight: 18.w,
                paddingBottome: 10.h,
              ),
            ),
            //? Inputs for verificaton code :
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextFormFiledVerficationCodeWidget(),
                TextFormFiledVerficationCodeWidget(),
                TextFormFiledVerficationCodeWidget(),
                TextFormFiledVerficationCodeWidget()
              ],
            ),
            SizedBox(height: 52.h),
            //? button for send verification code :
            MainElevatedButton(
              horizontalPadding: 110.w,
              text: AppWordManger.doneVerification,
              backgroundColor: AppColorManger.primaryColor,
              textColor: AppColorManger.white,
              onPreesed: () {
                Navigator.pushReplacementNamed(
                  context,
                  RouteNamedScreens.homeScreenNameRoute,
                );
              },
            ),
            //? text dont get number :build/app/outputs/flutter-apk/app-release.apk
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
