import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class GenderBackWidget extends StatefulWidget {
  const GenderBackWidget({
    super.key,
    required this.text,
    this.marginleft,
    this.marginRight,
  });
  final String text;
  final double? marginleft;
  final double? marginRight;

  @override
  State<GenderBackWidget> createState() => _GenderBackWidgetState();
}

bool changeBackGroundColor = false;

class _GenderBackWidgetState extends State<GenderBackWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          changeBackGroundColor = !changeBackGroundColor;
        });
      },
      child: Container(
        width: 74.5.w,
        height: 50.h,
        margin: EdgeInsets.only(
            left: widget.marginleft ?? 0.0, right: widget.marginRight ?? 0.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: changeBackGroundColor
              ? AppColorManger.primaryColor
              : AppColorManger.backGroundColorGender,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextUtiels(
          fontFamily: AppFontFamily.tajawalRegular,
          text: widget.text,
          color: AppColorManger.white,
          fontSize: AppFontSizeManger.s16,
        ),
      ),
    );
  }
}
