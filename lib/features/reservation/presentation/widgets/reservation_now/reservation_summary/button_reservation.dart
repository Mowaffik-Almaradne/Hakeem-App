import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/features/reservation/domain/entities/req/create_appoinment_request.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/create_apponiment_cubit/create_appoinment_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/logic/listener_logic.dart';

class ButtonReservation extends StatelessWidget {
  const ButtonReservation({
    super.key,
    required this.visible,
    required this.request,
  });
  final bool visible;
  final CreateAppoinmentRequest request;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateAppoinmentCubit, CreateAppoinmentState>(
      listener: (context, state) {
        ListenerLogic().createAppoinemntListerner(state, context);
      },
      builder: (context, state) {
        if (state.status == DeafultBlocStatus.loading) {
          return Padding(
            padding: EdgeInsets.only(top: 180.h),
            child: const MainLoadignWidget(),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(vertical: !visible ? 180.h : 0),
          child: MainElevatedButton(
            text: AppWordManger.continueReservation,
            backgroundColor: AppColorManger.primaryColor,
            textColor: AppColorManger.textColor1,
            horizontalPadding: 110.w,
            onPreesed: () {
              context
                  .read<CreateAppoinmentCubit>()
                  .createAppoinment(request: request);
            },
          ),
        );
      },
    );
  }
}
