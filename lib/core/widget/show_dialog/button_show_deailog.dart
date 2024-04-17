import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class ButtonShowDeailog extends StatelessWidget {
  const ButtonShowDeailog({
    super.key,
    required this.textButton,
    required this.textColor,
    required this.buttonColor,
  });
  final String textButton;
  final Color textColor;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.center,
        width: 110.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: buttonColor,
        ),
        child: TextUtiels(
          text: textButton,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 16.sp,
                color: textColor,
                fontFamily: AppFontFamily.extraBold,
              ),
        ),
      ),
    );
  }
}
