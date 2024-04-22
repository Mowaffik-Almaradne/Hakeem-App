import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hosptel_app/core/function/deate_function.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/form_filed/main_form_filed.dart';
import 'package:hosptel_app/core/widget/repeted/charater_city_widget.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/core/widget/form_filed/text_form_filed_pasword_widget.dart';
import 'package:hosptel_app/features/auth/presentation/widget/move_page_text_widget.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/gender_back_widget.dart';
import 'package:hosptel_app/router/app_router.dart';

class BottomeSheetSignUpWidget extends StatelessWidget {
  const BottomeSheetSignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Container(
      width: double.infinity,
      height: 520.h,
      decoration: BoxDecoration(
        color: AppColorManger.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.r),
          topRight: Radius.circular(50.r),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 35.w,
          vertical: 12.h,
        ),
        children: [
          SvgPicture.asset(
            width: 20.w,
            height: 4.h,
            AppSvgManger.rowBottomeSheet,
          ),
          SizedBox(height: 20.h),
          //? full name filed  :
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: MainTextFormFiled(
              hintText: AppWordManger.fullName,
              onChange: (value) {},
              textInputType: TextInputType.name,
              filedWidth: 250.w,
              filedHeight: 60.h,
              contentPaddingVertical: 13.h,
              contentPaddingHorizontal: 27.w,
            ),
          ),
          //? filed mobile phone :
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CharacterCityWidget(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 12.h,
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
                      LengthLimitingTextInputFormatter(8),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //? filed  Paswword :
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
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
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            child: MainTextFormFiled(
              readOnly: true,
              controller: controller,
              onTap: () async {
                await selecteDate(context, controller);
              },
              suffixIcon: Icons.calendar_month_outlined,
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
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 22.h),
                  decoration: BoxDecoration(
                    color: AppColorManger.fillColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: TextUtiels(
                    text: AppWordManger.gander,
                    style:
                        Theme.of(context).textTheme.displayMedium?.copyWith(
                              fontSize: 13.sp,
                              fontFamily: AppFontFamily.tajawalBold,
                            ),
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
            horizontalPadding: 80.w,
          ),
          SizedBox(height: 20.h),
          //? button for Create Account  :
          MainElevatedButton(
            text: AppWordManger.createAccount,
            backgroundColor: AppColorManger.primaryColor,
            textColor: AppColorManger.white,
            onPreesed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteNamedScreens.loginScreenNameRoute,
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
