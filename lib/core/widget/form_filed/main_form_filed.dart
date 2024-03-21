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
    required this.filedWidth,
    required this.filedHeight,
    this.validator,
    this.onTap,
    this.onFieldSubmitted,
    this.inputFormatter,
    this.onPressed,
    this.onPressedSuffixIcon,
  });
  final String hintText;
  final TextInputType textInputType;
  final Function(String) onChange;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatter;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onPressed;
  final double filedWidth;
  final double filedHeight;
  final void Function()? onPressedSuffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: filedWidth.w,
      height: filedHeight.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          textDirection: TextDirection.rtl,
          textInputAction: TextInputAction.next,
          inputFormatters: inputFormatter,
          keyboardType: textInputType,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColorManger.fillColor,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
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
