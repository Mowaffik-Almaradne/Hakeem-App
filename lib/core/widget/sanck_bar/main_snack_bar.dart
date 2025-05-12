import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class SnackBarUtil {
  //! function snack bar
  static void showSnackBar({
    required String message,
    required BuildContext context,
    Color? colorSuccess,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColorManger.white,
        content: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          //! Text Snack Bar
          child: Align(
            alignment: Alignment.center,
            child: TextUtiels(
              text: message,
              fontFamily: AppFontFamily.tajawalBold,
              fontSize: 13.sp,
              color: colorSuccess ?? AppColorManger.redColor,
            ),
          ), //!
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colorSuccess ?? AppColorManger.redColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
