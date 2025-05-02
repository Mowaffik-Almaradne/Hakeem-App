import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class ResendCodeWidget extends StatefulWidget {
  final Function()? onTap;

  const ResendCodeWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  MovPageTextState createState() => MovPageTextState();
}

class MovPageTextState extends State<ResendCodeWidget> {
  int _start = 60;
  Timer? _timer;
  bool _isTimerActive = false;

  void startTimer() {
    if (_isTimerActive) return;
    _isTimerActive = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        setState(() {
          _isTimerActive = false;
          _start = 60;
        });
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: _isTimerActive
              ? null
              : () {
                  startTimer();
                  widget.onTap?.call();
                },
          child: TextUtiels(
            text: _isTimerActive ? '$_start' : AppWordManger.resendMessage,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: AppFontSizeManger.s13,
                height: 4.h,
                color: _isTimerActive
                    ? AppColorManger.primaryColor
                    : AppColorManger.primaryColor),
          ),
        ),
        SizedBox(width: 8.w),
        TextUtiels(
          fontFamily: AppFontFamily.tajawalLight,
          text: AppWordManger.dontGetVerificationCode,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 10.sp,
              ),
        ),
      ],
    );
  }
}