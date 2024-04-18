import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/form_filed/text_form_filed_pasword_widget.dart';
import 'package:hosptel_app/core/widget/main/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/bacground_profile.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/label_text_form_filed.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: SingleChildScrollView(
        child: Column(
          children: [
            //? Back Ground Change Password :
            const BackGroundProfile(
              textBackGround: AppWordManger.changePassword,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextUtiels(
                paddingRight: 30.w,
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
                paddingRight: 30.w,
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
              paddingRight: 34.w,
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
                contenetPaddingvertical: 20.h,
                contentPaddingHorizontal: 16.w,
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
                contenetPaddingvertical: 20.h,
                contentPaddingHorizontal: 16.w,
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
              horizontalPadding: 70.w,
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
