import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFiledVerficationCodeWidget extends StatelessWidget {
  const TextFormFiledVerficationCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.next,
      inputFormatters: [LengthLimitingTextInputFormatter(1)],
      cursorHeight: 30.h,
      decoration: InputDecoration(
        constraints: BoxConstraints(maxWidth: 55.w),
      ),
    );
  }
}
