import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeFiledWidget extends StatelessWidget {
  const PinCodeFiledWidget({
    super.key,
    this.onChange,
    this.onCompleted,
    this.inActiveColor,
    this.selectColor,
  });
  final Function(String)? onChange;
  final void Function(String)? onCompleted;
  final Color? inActiveColor;
  final Color? selectColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 40.h),
      child: PinCodeTextField(
        keyboardType: TextInputType.number,
        appContext: context,
        length: 4,
        obscureText: false,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        animationType: AnimationType.fade,
        textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: AppFontWeightManger.fontWeightBold,
              fontSize: 24.sp,
            ),
        pinTheme: PinTheme(
          activeFillColor: AppColorManger.black,
          fieldWidth: 47.83.w,
          inactiveColor: inActiveColor ?? AppColorManger.pinColorFiled,
          selectedColor: selectColor ?? AppColorManger.primaryColor,
          activeColor: AppColorManger.primaryColor,
          shape: PinCodeFieldShape.underline,
          errorBorderColor: AppColorManger.redColor,
        ),
        animationDuration: const Duration(milliseconds: 300),
        onChanged: onChange,
        onCompleted: onCompleted,
      ),
    );
  }
}
