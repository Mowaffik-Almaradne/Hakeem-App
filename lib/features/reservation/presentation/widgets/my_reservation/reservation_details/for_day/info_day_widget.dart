import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/features/reservation/domain/entities/req/create_appoinment_request.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/get_all_avaliable_days_cubit/get_all_available_days_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/get_all_avaliable_days_cubit/get_all_available_days_state.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/get_all_avaliable_time_cubit/get_all_available_time_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/logic/listener_logic.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/reservation_details/for_day/info_day_item.dart';

class InfoDayWidget extends StatelessWidget {
  const InfoDayWidget({super.key, required this.request});
  final CreateAppoinmentRequest request;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20.h,
      ),
      child: BlocConsumer<GetAllAvaliableDaysCubit, GetAllAvaliableDaysState>(
        listener: (context, state) {
          ListenerLogic().avaliableDayListener(state, context, request);
        },
        builder: (context, state) {
          if (state.status == DeafultBlocStatus.loading) {
            return const MainLoadignWidget();
          }
          return SizedBox(
            height: 60.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: state.entitie.result.length,
              separatorBuilder: (context, index) => SizedBox(width: 11.w),
              itemBuilder: (context, index) {
                final data = state.entitie.result[index];
                bool isSelected = state.index == index;
                return InfoDayItem(
                  item: data,
                  fontColorDay:
                      isSelected ? AppColorManger.white : AppColorManger.black,
                  fontColorData:
                      isSelected ? AppColorManger.white : AppColorManger.black,
                  backGroundColor: isSelected
                      ? AppColorManger.primaryColor
                      : AppColorManger.white,
                  onTap: () {
                    if (!isSelected) {
                      //? Reset For Select :
                      context.read<GetAllAvaliableTimeCubit>().changeState(-1);
                      context
                          .read<GetAllAvaliableDaysCubit>()
                          .changeState(index);
                      context
                          .read<GetAllAvaliableTimeCubit>()
                          .getAllAvaliableDays(date: data.date);
                      request.appointmentDate = data.date;
                    }
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
