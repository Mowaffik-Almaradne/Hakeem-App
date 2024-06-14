import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/png_manger.dart';
import 'package:hosptel_app/features/auth/presentation/widget/bottome_sheet_verification_widget.dart';

class ConfirmPhoneNumberPage extends StatelessWidget {
  const ConfirmPhoneNumberPage({
    super.key,
    required this.phoneNumber,
  });
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
            image: AssetImage(AppPngManger.backGroundSignUpPage),
          ),
        ),
      ),
      bottomSheet: BottomeSheetVerifivcationWidget(
        numberPhone: '+963 $phoneNumber',
        fontColorSubText: AppColorManger.black,
        fontFamailySubText: AppFontFamily.tajawalBold,
        fontSizeSubText: 16.sp,
      ),
    );
  }
}
