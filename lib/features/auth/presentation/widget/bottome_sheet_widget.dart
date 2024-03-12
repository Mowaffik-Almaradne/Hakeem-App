import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/form_filed/main_form_filed.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

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
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 10.w),
                  width: 60.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                    color: AppColorManger.primaryColor,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 9.w),
                    child: TextUtiels(
                      text: '+963',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: AppColorManger.white,
                          ),
                    ),
                  ),
                ),
                MainTextFormFiled(
                  hintText: 'يرجى إدخال رقم هاتقك',
                  onChange: (value) {},
                  textInputType: TextInputType.phone,
                  filedWidth: 220,
                  filedHeight: 60,
                ),
              ],
            ),
            SizedBox(height: 21.h),
            MainTextFormFiled(
              hintText: 'كلمة السر ',
              obscureText: true,
              onChange: (value) {},
              textInputType: TextInputType.visiblePassword,
              filedWidth: 285,
              filedHeight: 60,
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.only(left: 160.w, bottom: 13.h),
              child: TextUtiels(
                text: 'هل نسيت كلمة السر؟',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: AppColorManger.primaryColor,
                      fontSize: AppFontSizeManger.s9,
                    ),
              ),
            ),
            MainElevatedButton(
              text: 'تسجيل الدخول',
              backgroundColor: AppColorManger.primaryColor,
              textColor: AppColorManger.white,
              onPreesed: () {},
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextUtiels(
                  text: 'إنشاء حساب',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppColorManger.primaryColor,
                        fontSize: AppFontSizeManger.s10,
                      ),
                ),
                SizedBox(width: 5.w),
                TextUtiels(
                  text: 'ليس لديك حساب مسبقا يرجى',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppColorManger.fillBlack,
                        fontSize: AppFontSizeManger.s10,
                      ),
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
