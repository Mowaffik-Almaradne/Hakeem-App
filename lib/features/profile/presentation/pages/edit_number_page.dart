import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/class/clipping_path_class.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/form_filed/main_form_filed.dart';
import 'package:hosptel_app/core/widget/main/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/repeted/charater_city_widget.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/label_text_form_filed.dart';
import 'package:hosptel_app/router/app_router.dart';

class EditNumberPage extends StatelessWidget {
  const EditNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: ClippingClass(),
              //? Back Ground Change Password Page :
              child: Container(
                width: double.infinity,
                height: 170.h,
                color: AppColorManger.backGroundClipper,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          AppSvgManger.iconArrow,
                          width: 30.w,
                          height: 30.h,
                        ),
                      ),
                      TextUtiels(
                        text: AppWordManger.editMyNumber,
                        fontFamily: AppFontFamily.tajawalBold,
                        color: AppColorManger.white,
                        fontSize: AppFontSizeManger.s20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Align(
              alignment: Alignment.centerRight,
              child: TextUtiels(
                paddingRight: 17.w,
                paddingBottome: 11.h,
                text: AppWordManger.editNumber,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 22.sp,
                    ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextUtiels(
                paddingRight: 17.w,
                paddingBottome: 42.h,
                text: AppWordManger.pleaseWriteTheNewNumber,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 16.sp,
                      color: AppColorManger.black.withOpacity(0.7),
                    ),
              ),
            ),
            //? Filed For Write Phone Number :
            LabelTextFormFiled(
              text: AppWordManger.newNumber,
              paddingTop: 0,
              paddingRight: 17.w,
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CharacterCityWidget(
                  paddingTop: 20.h,
                  paddingbottome: 20.h,
                ),
                MainTextFormFiled(
                  inputFormatter: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(8),
                  ],
                  hintText: AppWordManger.pleaseWritePhoneNumber,
                  filedWidth: 260.w,
                  onChange: (value) {},
                  textInputType: TextInputType.number,
                  fillColor: AppColorManger.white,
                  borderColor: AppColorManger.borderColor,
                  borderWidht: 1.3.w,
                  contentPaddingVertical: 19.h,
                  contentPaddingHorizontal: 16.w,
                  hintTextColor: AppColorManger.black.withOpacity(0.5),
                  fontSize: 15.sp,
                ),
              ],
            ),
            SizedBox(height: 59.h),
            //? Button For Sure Info :
            MainElevatedButton(
              horizontalPadding: 120,
              verticalPadding: 10,
              text: AppWordManger.sure,
              backgroundColor: AppColorManger.secoundryColor,
              textColor: AppColorManger.white,
              onPreesed: () {
                Navigator.pushNamed(
                  context,
                  RouteNamedScreens.verificationEditNumberNameRoute,
                );
              },
            ),
            SizedBox(height: 38.h),
          ],
        ),
      ),
    );
  }
}
