import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/png_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/form_filed/main_form_filed.dart';
import 'package:hosptel_app/core/widget/main/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/profile/presentation/helper/class_clipping_helper.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/chracter_number_widget.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/gender_back_widget.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/label_text_form_filed.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/label_type_gender_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: ClippingClass(),
                  child: Container(
                    width: double.infinity,
                    height: 170.h,
                    color: AppColorManger.backGroundClipper,
                  ),
                ),
                Positioned(
                  bottom: -27.h,
                  child: Image.asset(
                    width: 100.w,
                    height: 100.h,
                    AppPngManger.imageProfile,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h),
            TextUtiels(
              text: 'حسن الحلاق',
              fontFamily: AppFontFamily.tajawalBold,
              color: AppColorManger.textColor2,
              fontSize: AppFontSizeManger.s24,
            ),
            TextUtiels(
              text: AppWordManger.welcome,
              fontFamily: AppFontFamily.tajawalBold,
              color: AppColorManger.textlight,
              fontSize: AppFontSizeManger.s13,
            ),
            //? filed privat name :
            const LabelTextFormFiled(
              text: AppWordManger.fullName,
              paddingTop: 50,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 25.w,
                right: 51.w,
                top: 10.h,
              ),
              child: MainTextFormFiled(
                onChange: (value) {},
                textInputType: TextInputType.name,
                fillColor: AppColorManger.white,
                borderColor: AppColorManger.borderColor,
                borderWidht: 1.3.w,
                contentPaddingVertical: 15.h,
                contentPaddingHorizontal: 27.w,
              ),
            ),
            //? privat number :
            const LabelTextFormFiled(
              text: AppWordManger.phoneNumber,
              paddingTop: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CharacterNumberWidget(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.h,
                    left: 10.w,
                    right: 22.w,
                  ),
                  child: MainTextFormFiled(
                    filedWidth: 230.w,
                    onChange: (value) {},
                    textInputType: TextInputType.name,
                    fillColor: AppColorManger.white,
                    borderColor: AppColorManger.borderColor,
                    borderWidht: 1.3.w,
                    contentPaddingVertical: 15.h,
                    contentPaddingHorizontal: 27.w,
                  ),
                ),
              ],
            ),
            //? password form filed :
            const LabelTextFormFiled(
              text: AppWordManger.password,
              paddingTop: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 25.w,
                right: 51.w,
                top: 10.h,
              ),
              child: MainTextFormFiled(
                obscureText: true,
                onChange: (value) {},
                textInputType: TextInputType.name,
                fillColor: AppColorManger.white,
                borderColor: AppColorManger.borderColor,
                borderWidht: 1.3.w,
                contentPaddingVertical: 15.h,
                contentPaddingHorizontal: 27.w,
              ),
            ),
            //? birh day  form filed :
            const LabelTextFormFiled(
              text: AppWordManger.birthDay,
              paddingTop: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 25.w,
                right: 51.w,
                top: 10.h,
                bottom: 9.h,
              ),
              child: MainTextFormFiled(
                obscureText: true,
                onChange: (value) {},
                textInputType: TextInputType.name,
                fillColor: AppColorManger.white,
                borderColor: AppColorManger.borderColor,
                borderWidht: 1.3.w,
                contentPaddingVertical: 15.h,
                contentPaddingHorizontal: 27.w,
              ),
            ),
            //? choose gender :
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const GenderBackWidget(
                  text: AppWordManger.fmeal,
                ),
                GenderBackWidget(
                  text: AppWordManger.meal,
                  marginleft: 12.w,
                  marginRight: 12.w,
                ),
                const LabelTypeGenderWidget(),
              ],
            ),
            SizedBox(height: 33.h),
            //? button save info :
            MainElevatedButton(
              heightButton: 50.h,
              widthButton: 154.w,
              text: AppWordManger.save,
              backgroundColor: AppColorManger.secoundryColor,
              textColor: AppColorManger.white,
              onPreesed: () {},
            ),
            SizedBox(height: 27.h),
          ],
        ),
      ),
    );
  }
}
