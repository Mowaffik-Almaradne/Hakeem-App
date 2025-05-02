import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:shimmer/shimmer.dart';

class LoadingBackGroundWidget extends StatelessWidget {
  const LoadingBackGroundWidget({super.key, this.height = 210, this.margin});
  final double height;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: margin ?? EdgeInsets.only(bottom: 20.h),
        height: height.h,
        decoration: BoxDecoration(
          color: AppColorManger.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
