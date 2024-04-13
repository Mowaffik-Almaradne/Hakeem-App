import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class GenderBackWidget extends StatefulWidget {
  const GenderBackWidget({
    Key? key,
    required this.texts,
    this.marginleft,
    this.marginRight,
  }) : super(key: key);

  final List<String> texts;
  final double? marginleft;
  final double? marginRight;

  @override
  State<GenderBackWidget> createState() => _GenderBackWidgetState();
}

int selectIndex = 1;

class _GenderBackWidgetState extends State<GenderBackWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      //? list for choose gender :
      children: List.generate(widget.texts.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectIndex = index;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 18.h),
            margin: EdgeInsets.only(
              left: widget.marginleft ?? 0.0,
              right: widget.marginRight ?? 0.0,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selectIndex == index
                  ? AppColorManger.primaryColor
                  : AppColorManger.backGroundColorGender,
              borderRadius: BorderRadius.circular(18.r),
            ),
            //? pass text gender :
            child: TextUtiels(
              fontFamily: AppFontFamily.tajawalBold,
              text: widget.texts[index],
            ),
          ),
        );
      }),
    );
  }
}
