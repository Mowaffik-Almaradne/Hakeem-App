import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/repeted/titel_pages_widget.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class EmptyMonyAccountWidget extends StatelessWidget {
  const EmptyMonyAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitlePageWidget(
          titleText: AppWordManger.finisialAccount,
          onTap: () => Navigator.pop(context),
          paddingBottome: 150.h,
        ),
        SvgPicture.asset(
          width: 127,
          height: 127.h,
          AppSvgManger.emptyIconMonyAccount,
        ),
        TextUtiels(
          paddingTop: 50.h,
          text: AppWordManger.notFoundInformation,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 24.sp,
              ),
        )
      ],
    );
  }
}
