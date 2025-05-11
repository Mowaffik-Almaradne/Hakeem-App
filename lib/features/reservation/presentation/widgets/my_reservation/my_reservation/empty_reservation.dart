import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class EmptyReservationWidget extends StatelessWidget {
  const EmptyReservationWidget({super.key, required this.mainText});
  final String mainText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          width: 122.88.w,
          height: 120.11.h,
          AppSvgManger.noReservationNow,
        ),
        TextUtiels(
          paddingTop: 20.h,
          text: mainText,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 24.sp,
              ),
        )
      ],
    );
  }
}
