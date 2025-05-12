import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/png_manger.dart';
import 'package:hosptel_app/features/auth/presentation/widget/bottome_sheet_confirm_forget_password.dart';

class ConfirmFrogetPassword extends StatelessWidget {
  const ConfirmFrogetPassword({super.key, required this.phoneNumber});
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppPngManger.backGroundLoginPage),
          ),
        ),
      ),
      bottomSheet: BottomeSheetConfirmPasswordWidget(
        numberPhone: phoneNumber,
        fontColorSubText: AppColorManger.textColor2,
        fontFamailySubText: AppFontFamily.tajawalRegular,
        fontSizeSubText: 12.sp,
      ),
    );
  }
}
