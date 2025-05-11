import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class SnackBarBackToExit {
  static void snackBar({required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: TextUtiels(
            text: AppWordManger.preesAnotherForExit,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 15.sp,
                ),
          ),
        ),
        backgroundColor: AppColorManger.primaryColor, // Background color
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsetsDirectional.only(
          bottom: 35.h,
          start: 50.w,
          end: 50.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25), // Rounded corners
        ),
      ),
    );
  }
}
