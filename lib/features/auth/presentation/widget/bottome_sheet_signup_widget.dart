import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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
import 'package:hosptel_app/features/profile/presentation/widgets/gender_back_widget.dart';
import 'package:hosptel_app/router/app_router.dart';

class BottomeSheetSignUpWidget extends StatelessWidget {
  const BottomeSheetSignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400.h,
      decoration: BoxDecoration(
        color: AppColorManger.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 45.w),
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
          //? full name filed  :
          Padding(
            padding: EdgeInsets.only(
              top: 10.h,
              right: 2.w,
            ),
            child: MainTextFormFiled(
              hintText: AppWordManger.fullName,
              onChange: (value) {},
              textInputType: TextInputType.name,
              filedWidth: 275.w,
              filedHeight: 60.h,
              contentPaddingVertical: 13.h,
              contentPaddingHorizontal: 25.w,
            ),
          ),
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
          //? filed birthDay :
          Padding(
            padding: EdgeInsets.only(
              top: 10.h,
              bottom: 10.h,
            ),
            child: MainTextFormFiled(
              hintText: AppWordManger.birthDay,
              onChange: (value) {},
              textInputType: TextInputType.name,
              filedWidth: 275.w,
              filedHeight: 60.h,
              contentPaddingVertical: 13.h,
              contentPaddingHorizontal: 25.w,
            ),
          ),
          //? choose Gender :
          Padding(
            padding: EdgeInsets.only(
              right: 6.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GenderBackWidget(
                  texts: const [AppWordManger.fmeal, AppWordManger.meal],
                  marginRight: 10.w,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  decoration: BoxDecoration(
                    color: AppColorManger.fillColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: TextUtiels(
                    text: AppWordManger.gander,
                    fontFamily: AppFontFamily.tajawalBold,
                    color: AppColorManger.black,
                    fontSize: AppFontSizeManger.s14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          //? button for Gust  :
          MainElevatedButton(
            text: AppWordManger.loginGust,
            backgroundColor: AppColorManger.secoundryColor,
            textColor: AppColorManger.white,
            onPreesed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteNamedScreens.homeScreenNameRoute,
                (route) => false,
              );
            },
            horizontalPadding: 83.w,
          ),
          SizedBox(height: 20.h),
          //? button for login :
          MainElevatedButton(
            text: AppWordManger.createAccount,
            backgroundColor: AppColorManger.primaryColor,
            textColor: AppColorManger.white,
            onPreesed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteNamedScreens.homeScreenNameRoute,
                (route) => false,
              );
            },
          ),
          //? any account go to page login :
          MovPageText(
            movPageText: AppWordManger.login,
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                RouteNamedScreens.loginScreenNameRoute,
              );
            },
            primaryText: AppWordManger.dontHaveAnAccountAlreadyPlease,
          ),

          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
