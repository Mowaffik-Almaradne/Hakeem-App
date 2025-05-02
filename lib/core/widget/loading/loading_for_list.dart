import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingForList extends StatelessWidget {
  const LoadingForList({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 130.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class LoadingListViewHorisontal extends StatelessWidget {
  const LoadingListViewHorisontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 19.w, right: 19.w),
      child: Column(
        children: [
          const LoadingForList(),
          SizedBox(height: 25.h),
          const LoadingForList(),
          SizedBox(height: 25.h),
          const LoadingForList(),
          SizedBox(height: 25.h),
        ],
      ),
    );
  }
}
