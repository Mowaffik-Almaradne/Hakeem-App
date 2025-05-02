import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/class/clipping_path_class.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/png_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';

class HeaderInfoProfileWidget extends StatelessWidget {
  const HeaderInfoProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        ClipPath(
          clipper: ClippingClass(),
          child: Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 170.h,
            color: AppColorManger.backGroundClipper,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: SvgPicture.asset(
                  AppSvgManger.iconArrow,
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -5.h,
          child: Image.asset(
            width: 100.w,
            height: 100.h,
            AppPngManger.imageProfile,
          ),
        ),
      ],
    );
  }
}
