import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/doctor/presentation/cubit/about_doctor_cubit/doctor_cubit.dart';
import 'package:shimmer/shimmer.dart';

class InfoDoctorText extends StatelessWidget {
  const InfoDoctorText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAboutDoctorCubit, GetAboutDoctorState>(
      builder: (context, state) {
        if (state.status == DeafultBlocStatus.loading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              height: 130.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        }
        final data = state.entitie.result;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 5.h),
          child: TextUtiels(
            text: data.introduction,
            fontFamily: AppFontFamily.tajawalRegular,
            color: AppColorManger.textColor1,
            fontSize: AppFontSizeManger.s13,
            height: 1.5.h,
          ),
        );
      },
    );
  }
}
