import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';

class TextFormFiledVerficationCodeWidget extends StatelessWidget {
  const TextFormFiledVerficationCodeWidget({
    super.key,
    required this.onChanged,
  });
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w800,
        color: AppColorManger.black,
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
      cursorHeight: 30.h,
      decoration: InputDecoration(
        constraints: BoxConstraints(maxWidth: 55.w),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 1,
        ),
      ),
      onChanged: (value) {
        if (value.length == 1) {
          nextFilledFun(value, context);
        }
        onChanged;
      },
    );
  }
}

void nextFilledFun(String value, BuildContext context) {
  if (value.length == 1) {
    FocusScope.of(context).nextFocus();
  }
}
