import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/empty_data/empty_text_widget.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/doctor/presentation/cubit/get_all_work_hours_cubit/get_all_work_hours_for_doctor_cubit.dart';
import 'package:hosptel_app/features/doctor/presentation/cubit/get_all_work_hours_cubit/get_all_work_hours_for_doctor_state.dart';

class InfoDaysAndTimesWidget extends StatelessWidget {
  const InfoDaysAndTimesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllWorkHoursForDoctorCubit,
        GetAllWorkHoursForDoctorState>(
      builder: (context, state) {
        if (state.status == DeafultBlocStatus.loading) {
          return const MainLoadignWidget();
        }
        return Visibility(
          visible: state.entitie.result.isNotEmpty,
          replacement: const EmptyTextWidget(
            text: AppWordManger.notFoundeWorkHoursAvialibale,
          ),
          child: SizedBox(
            height: 120.h,
            child: ListView.separated(
              itemCount: state.entitie.result.length,
              separatorBuilder: (context, index) => SizedBox(height: 9.h),
              itemBuilder: (context, index) {
                final data = state.entitie.result[index];
                String fromTime = data.fromTime.substring(0, 5);
                String toTime = data.toTime.substring(0, 5);
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextUtiels(
                        text:
                            '${data.fromTime.isNotEmpty ? fromTime : ""}_${data.toTime.isNotEmpty ? toTime : ""}',
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight:
                                      AppFontWeightManger.fontWeightSemiBold,
                                ),
                      ),
                      TextUtiels(
                        text: data.dayName,
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight:
                                      AppFontWeightManger.fontWeightSemiBold,
                                ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
