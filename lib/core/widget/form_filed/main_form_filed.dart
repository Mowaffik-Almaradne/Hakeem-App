import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/function/outline_input_border_function.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';

class MainTextFormFiled extends StatelessWidget {
  const MainTextFormFiled({
    super.key,
    required this.hintText,
    required this.onChange,
    required this.textInputType,
    this.filedWidth,
    this.filedHeight,
    this.validator,
    this.onTap,
    this.onFieldSubmitted,
    this.inputFormatter,
    this.onPressed,
    this.onPressedSuffixIcon,
    this.fillColor,
    this.borderColor,
    this.borderWidht,
    this.contentPaddingHorizontal,
    this.contentPaddingVertical,
    this.obscureText,
  });
  final String hintText;
  final TextInputType textInputType;
  final Function(String) onChange;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatter;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onPressed;
  final double? filedWidth;
  final double? filedHeight;
  final void Function()? onPressedSuffixIcon;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderWidht;
  final double? contentPaddingHorizontal;
  final double? contentPaddingVertical;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: filedWidth,
      height: filedHeight,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
      
          obscureText: obscureText ?? false,
          textDirection: TextDirection.rtl,
          textInputAction: TextInputAction.next,
          inputFormatters: inputFormatter,
          keyboardType: textInputType,
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor ?? AppColorManger.fillColor,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(
              horizontal: contentPaddingHorizontal ?? 12.w,
              vertical: contentPaddingVertical ?? 12.h,
            ),
            hintStyle: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: AppFontSizeManger.s13,
              color: AppColorManger.black,
              fontWeight: AppFontWeightManger.fontWeightRagular,
            ),
            enabledBorder: outlineInputBorder(
              circular: 13,
              width: borderWidht ?? 0,
              color: borderColor ?? Colors.transparent,
            ),
            focusedBorder: outlineInputBorder(
              circular: 13,
              width: borderWidht ?? 0,
              color: borderColor ?? Colors.transparent,
            ),
            errorBorder: outlineInputBorder(
              circular: 13,
              width: borderWidht ?? 0,
              color: borderColor ?? Colors.transparent,
            ),
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
