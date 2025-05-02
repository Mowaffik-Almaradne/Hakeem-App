import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class MainElevatedButton extends StatelessWidget {
  const MainElevatedButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPreesed,
    this.horizontalPadding,
    this.verticalPadding,
    this.raduiseBorder,
    this.paddingOut,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final void Function()? onPreesed;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? raduiseBorder;
  final EdgeInsetsGeometry? paddingOut;
  @override
  Widget build(BuildContext context) {
    //! Button All App
    return Padding(
      padding: paddingOut ?? const EdgeInsets.all(0),
      child: ElevatedButton(
        onPressed: onPreesed,
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(raduiseBorder ?? 20).r,
          ),
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? 10.5.w,
            horizontal: horizontalPadding ?? 85.5.h,
          ),
          backgroundColor: backgroundColor,
        ),
        child: TextUtiels(
          text: text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 16.sp,
              ),
        ),
      ),
    );
  }
}
