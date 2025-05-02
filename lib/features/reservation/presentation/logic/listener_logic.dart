import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/core/function/show_dailog_guest.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/widget/sanck_bar/main_snack_bar.dart';
import 'package:hosptel_app/features/reservation/domain/entities/req/create_appoinment_request.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/create_apponiment_cubit/create_appoinment_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/get_all_avaliable_days_cubit/get_all_available_days_state.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/get_all_avaliable_time_cubit/get_all_available_time_cubit.dart';

class ListenerLogic {
  //? Avaliable Day Listener :
  void avaliableDayListener(GetAllAvaliableDaysState state,
      BuildContext context, CreateAppoinmentRequest request) {
    if (state.status == DeafultBlocStatus.done && state.index == 0) {
      final firstDate = state.entitie.result[0].date;
      request.appointmentDate = firstDate;
      context
          .read<GetAllAvaliableTimeCubit>()
          .getAllAvaliableDays(date: firstDate);
    }
  } //?

  //? Create Apponiment Listener :
  void createAppoinemntListerner(
      CreateAppoinmentState state, BuildContext context) {
    if (state.failureMessage.statusCode == 401) {
      showDialogForGuest(context);
    } else if (state.status == DeafultBlocStatus.done) {
      showDialogForResrvation(context);
    } else if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
        message: state.failureMessage.message,
        context: context,
      );
    }
  }
}
