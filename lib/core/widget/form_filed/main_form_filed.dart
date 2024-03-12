import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/function/outline_input_border_function.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';

class MainTextFormFiled extends StatelessWidget {
  const MainTextFormFiled({
    super.key,
    required this.hintText,
    required this.onChange,
    required this.textInputType,
    this.validator,
    this.suffixIcon,
    this.onTap,
    this.onFieldSubmitted,
    this.inputFormatter,
    this.obscureText,
    this.colorsuffixIcon,
    this.onPressed,
    this.controller,
    this.iconDone,
    required this.filedWidth,
    required this.filedHeight,
  });
  final String hintText;
  final TextInputType textInputType;
  final Function(String) onChange;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Color? colorsuffixIcon;
  final String? suffixIcon;
  final bool? obscureText;
  final IconData? iconDone;
  final List<TextInputFormatter>? inputFormatter;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onPressed;
  final double filedWidth;
  final double filedHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: filedWidth.w,
      height: filedHeight.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText ?? false,
          textDirection: TextDirection.rtl,
          textInputAction: TextInputAction.next,
          inputFormatters: inputFormatter,
          keyboardType: textInputType,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColorManger.fillColor,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 19.h,
            ),
            hintStyle: Theme.of(context).textTheme.labelSmall,
            enabledBorder: outlineInputBorder(circular: 13),
            focusedBorder: outlineInputBorder(circular: 13),
            errorBorder: outlineInputBorder(circular: 13),
          ),
          onChanged: onChange,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
        ),
      ),
    );
  }
}


/*

          errorStyle: TextStyle(
            fontFamily: FontFamily.fontPoppinsBold,
            fontSize: 12.sp,
            color: AppColors.borderColor,
          ),
*/
