import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/form_filed/main_form_filed.dart';
import 'package:hosptel_app/core/widget/main/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

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
                    color: const Color(0xff0173B4),
                  ),
                ),
                Positioned(
                  bottom: -27.h,
                  child: Image.asset(
                    width: 100.w,
                    height: 100.h,
                    'assets/image/png/3d_avatar_21.png',
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h),
            TextUtiels(
              text: 'حسن الحلاق',
              color: AppColorManger.textColor2,
              fontSize: AppFontSizeManger.s24,
              fontWeight: AppFontWeightManger.fontWeightRagularBold,
            ),
            TextUtiels(
              text: 'مرحبا بك',
              color: AppColorManger.textlight,
              fontWeight: AppFontWeightManger.fontWeightBold,
              fontSize: AppFontSizeManger.s13,
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(top: 50.h, right: 55.sp),
              child: TextUtiels(
                text: 'الاسم الكامل',
                color: AppColorManger.black,
                fontWeight: AppFontWeightManger.fontWeightRagular,
                fontSize: AppFontSizeManger.s13,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 25.w,
                right: 51.w,
                top: 10.h,
              ),
              //? filed privat name :
              child: MainTextFormFiled(
                hintText: '',
                onChange: (value) {},
                textInputType: TextInputType.name,
                fillColor: AppColorManger.white,
                borderColor: AppColorManger.borderColor,
                borderWidht: 1.3.w,
                contentPaddingVertical: 15.h,
                contentPaddingHorizontal: 27.w,
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(top: 10.h, right: 55.sp),
              child: TextUtiels(
                text: 'رقم هاتفك',
                color: AppColorManger.black,
                fontWeight: AppFontWeightManger.fontWeightRagular,
                fontSize: AppFontSizeManger.s13,
              ),
            ),
            //? privat number :
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
                //? privat password
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.h,
                    left: 10.w,
                    right: 22.w,
                  ),
                  child: MainTextFormFiled(
                    filedWidth: 230.w,
                    hintText: '',
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
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(top: 10.h, right: 55.sp),
              child: TextUtiels(
                text: 'كلمة السر',
                color: AppColorManger.black,
                fontWeight: AppFontWeightManger.fontWeightRagular,
                fontSize: AppFontSizeManger.s13,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 25.w,
                right: 51.w,
                top: 10.h,
              ),
              //? filed privat name :
              child: MainTextFormFiled(
                obscureText: true,
                hintText: '',
                onChange: (value) {},
                textInputType: TextInputType.name,
                fillColor: AppColorManger.white,
                borderColor: AppColorManger.borderColor,
                borderWidht: 1.3.w,
                contentPaddingVertical: 15.h,
                contentPaddingHorizontal: 27.w,
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(top: 10.h, right: 55.sp),
              child: TextUtiels(
                text: 'تاريخ ميلادك',
                color: AppColorManger.black,
                fontWeight: AppFontWeightManger.fontWeightRagular,
                fontSize: AppFontSizeManger.s13,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 25.w,
                right: 51.w,
                top: 10.h,
              ),
              //? filed privat name :
              child: MainTextFormFiled(
                obscureText: true,
                hintText: '',
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
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 10);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 20);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 20);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
