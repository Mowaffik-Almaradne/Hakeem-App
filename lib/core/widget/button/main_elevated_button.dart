import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class MainElevatedButton extends StatelessWidget {
  const MainElevatedButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPreesed,
    this.sideColor,
    this.width,
    this.icon,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final void Function()? onPreesed;
  final Color? sideColor;
  final double? width;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    //! Button All App
    return SizedBox(
      width: 290.w,
      height: 60.h,
      child: ElevatedButton(
        onPressed: onPreesed,
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          backgroundColor: backgroundColor,
        ),
        child: TextUtiels(
          text: text,
          fontWeight: AppFontWeightManger.fontWeightBold,
          color: AppColorManger.white,
          fontSize: AppFontSizeManger.s16,
        ),
      ),
    );
  }
}
  