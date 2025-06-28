import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/reservation/domain/entities/req/create_appoinment_request.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/get_all_avaliable_time_cubit/get_all_available_time_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/function/helper_function.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/reservation_details/for_time/info_item_time.dart';

class InfoTimesWidget extends StatelessWidget {
  const InfoTimesWidget({super.key, required this.request});
  final CreateAppoinmentRequest request;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20.h,
      ),
      child: BlocConsumer<GetAllAvaliableTimeCubit, GetAllAvaliableTimeState>(
        listener: (context, state) {
          if (state.status == DeafultBlocStatus.loading) {
            request.startTime = "";
            request.endTime = "";
          }
        },
        builder: (context, state) {
          if (state.status == DeafultBlocStatus.loading) {
            return const MainLoadignWidget();
          }
          return Visibility(
            visible: state.entitie.result.isEmpty &&
                state.status == DeafultBlocStatus.done,
            replacement: SizedBox(
              height: 50.h,
              child: ListView.separated(
                reverse: true,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: state.entitie.result.length,
                separatorBuilder: (context, index) => SizedBox(width: 11.w),
                itemBuilder: (context, index) {
                  final data = state.entitie.result[index];
                  bool isReservation = (data.isBooked == true) ||
                      (data.isSetUnavailable == true);
                  bool isSelect = state.index == index;
                  return InfoTimeItemWidget(
                    onTap: () {
                      if (!isReservation) {
                        context
                            .read<GetAllAvaliableTimeCubit>()
                            .changeState(index);

                        request.startTime = data.fromTime;
                        request.endTime = data.toTime;
                      }
                    },
                    borderColor: StateResevation().changeStateReservationBorder(
                        isSelect: isSelect, isReservation: isReservation),
                    backGroundColor: StateResevation()
                        .changeStateReservationBackGround(
                            isReservation: isReservation, isSelect: isSelect),
                    fromTimeTextColor: StateResevation()
                        .changeStateReservationText(
                            isReservation: isReservation, isSelect: isSelect),
                    item: data,
                  );
                },
              ),
            ),
            child: TextUtiels(
              text: AppWordManger.notAvailableAtTimesOnThisDay,
              color: AppColorManger.black,
            ),
          );
        },
      ),
    );
  }
}
