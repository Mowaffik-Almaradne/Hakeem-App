import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/core/widget/show_dialog/main_show_dialog_widget.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/router/app_router.dart';

class ReservationNowButtonWidget extends StatelessWidget {
  const ReservationNowButtonWidget({
    super.key,
    required this.text,
    this.marginLeft,
  });
  final String text;
  final double? marginLeft;
  @override
  Widget build(BuildContext context) {
    String token = AppSharedPreferences.getToken();
    return GestureDetector(
      onTap: () {
        if (token.isEmpty) {
          MainShowDialog.customShowDialog(
            hieght: 150.h,
            context,
            onTapFirst: () {
              Navigator.pop(context);
            },
            onTapSecound: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteNamedScreens.loginScreenNameRoute,
                (route) => false,
              );
            },
            firstButtonText: AppWordManger.notUntil,
            secoundButtonText: AppWordManger.login,
            textPopUp: AppWordManger.loginMustFirst,
          );
        } else {
          Navigator.pushNamed(
            context,
            RouteNamedScreens.reservationDetailsNameRoute,
          );
        }
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 130.w,
          height: 45.h,
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            left: marginLeft ?? 28.w,
            bottom: 15.h,
          ),
          decoration: ShapeDecoration(
            color: AppColorManger.primaryColor.withOpacity(0.98),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.r),
            ),
          ),
          child: TextUtiels(
            text: text,
            fontFamily: AppFontFamily.extraBold,
            color: AppColorManger.white,
            fontSize: AppFontSizeManger.s18,
          ),
        ),
      ),
    );
  }
}
