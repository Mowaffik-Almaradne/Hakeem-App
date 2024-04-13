import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/class/clipping_path_class.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/form_filed/text_form_filed_pasword_widget.dart';
import 'package:hosptel_app/core/widget/main/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/label_text_form_filed.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

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
                        text: AppWordManger.changePassword,
                        fontFamily: AppFontFamily.tajawalBold,
                        color: AppColorManger.white,
                        fontSize: AppFontSizeManger.s20,
                      ),
                    ],
                  ),
                ),
              ),
            ), //?
            SizedBox(height: 30.h),
            Align(
              alignment: Alignment.centerRight,
              child: TextUtiels(
                paddingRight: 17.w,
                paddingBottome: 11.h,
                text: AppWordManger.changePassword,
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
                text: AppWordManger.pleaseWriteSomeThingYouRemember,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 16.sp,
                      color: AppColorManger.black.withOpacity(0.7),
                    ),
              ),
            ),
            //? Filled Password New :
            LabelTextFormFiled(
              text: AppWordManger.newPassword,
              paddingTop: 0,
              paddingRight: 37.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 34.w,
                vertical: 9.h,
              ),
              child: TextFormFiledPassword(
                hintText: AppWordManger.mustbeSavenNumbers,
                onChange: (value) {},
                textInputType: TextInputType.name,
                contenetPaddingvertical: 18.h,
                contentPaddingHorizontal: 16.w,
                suffixIconColor: AppColorManger.black.withOpacity(0.6),
                filled: false,
                fillColor: AppColorManger.white,
                borderColor: AppColorManger.borderColor,
                borderWidht: 1.3.w,
                colorHintText: AppColorManger.black.withOpacity(0.5),
                fontSizeHintText: 16.sp,
                fontWeightHintText: AppFontWeightManger.fontWeightSemiBold,
              ),
            ),
            SizedBox(height: 21.h),
            //? Filled R Enter Password New :
            LabelTextFormFiled(
              text: AppWordManger.confirmTheNewPassword,
              paddingTop: 0,
              paddingRight: 37.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 34.w,
                vertical: 9.h,
              ),
              child: TextFormFiledPassword(
                hintText: AppWordManger.reEnterPassword,
                onChange: (value) {},
                textInputType: TextInputType.name,
                contenetPaddingvertical: 18.h,
                contentPaddingHorizontal: 16.w,
                suffixIconColor: AppColorManger.black.withOpacity(0.6),
                filled: false,
                fillColor: AppColorManger.white,
                borderColor: AppColorManger.borderColor,
                borderWidht: 1.3.w,
                colorHintText: AppColorManger.black.withOpacity(0.5),
                fontSizeHintText: 16.sp,
                fontWeightHintText: AppFontWeightManger.fontWeightSemiBold,
              ),
            ),
            //? Button for cahnge Password  :
            SizedBox(height: 38.h),
            MainElevatedButton(
              text: AppWordManger.changePassword,
              backgroundColor: AppColorManger.secoundryColor,
              textColor: AppColorManger.white,
              onPreesed: () {},
            ),
            SizedBox(height: 38.h),
          ],
        ),
      ),
    );
  }
}
