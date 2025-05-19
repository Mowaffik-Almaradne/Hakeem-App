import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/main/main_app_bar/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/show_dialog/main_show_dialog_widget.dart';
import 'package:hosptel_app/features/reservation/domain/entities/req/create_appoinment_request.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/get_all_avaliable_days_cubit/get_all_available_days_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/reservation_details/info_day_weak_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/reservation_details/app_bar/app_bar_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/reservation_details/for_day/info_day_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/reservation_details/for_time/info_time_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/reservation_details/label_text/label_text_time_day_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/reservation_details/label_text/label_text_widget.dart';
import 'package:hosptel_app/router/app_router.dart';

class DetailesReservationPage extends StatelessWidget {
  const DetailesReservationPage({super.key, required this.request});
  final CreateAppoinmentRequest request;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<GetAllAvaliableDaysCubit>()
            .getAllAvaliableDays(isRefrash: true);
      },
      child: MainBackGround(
        mainBody: SingleChildScrollView(
          child: Column(
            children: [
              //?api : App Bar
              const AppBarReservationDetailsWidget(),
              //? Label Tetx Work Hour :
              LabelTextWidget(
                paddingRight: 20.w,
                paddingTop: 24.h,
                paddingBottome: 12.h,
                text: AppWordManger.workHoursForDoctor,
              ),
              //? Info Fo Day And Time :
              const InfoDaysAndTimesWidget(),
              //? Label Tetx bookingReservation :
              LabelTextWidget(
                paddingRight: 18.w,
                paddingTop: 27.h,
                text: AppWordManger.bookingReservation,
              ),
              //? Label Text Day :
              const LabelTextSlider(
                name: AppWordManger.day,
              ),
              //? Info Day :
              InfoDayWidget(
                request: request,
              ),
              //? Label Text Time :
              const LabelTextSlider(
                name: AppWordManger.time,
              ),
              //? Info Time :
              InfoTimesWidget(
                request: request,
              ),

              //? Button Ensure Resevation :
              Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 40.h),
                child: MainElevatedButton(
                  text: AppWordManger.reservationConfarmation,
                  backgroundColor: AppColorManger.primaryColor,
                  textColor: AppColorManger.white,
                  onPreesed: () {
                    if (request.endTime.isNotEmpty &&
                        request.startTime.isNotEmpty) {
                      Navigator.pushNamed(
                        context,
                        RouteNamedScreens.reservationSummaryNameRoute,
                        arguments: request,
                      );
                    } else {
                      MainShowDialog.customShowDialog(
                        isRow: false,
                        insetPadding: EdgeInsets.symmetric(
                          vertical: 215.h,
                          horizontal: 20.w,
                        ),
                        textPopUp: AppWordManger
                            .pleaseSelectTheDayAndTimeToMakeTheReservation,
                        context,
                        onTapFirst: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        onTapSecound: () {
                          Navigator.pop(context);
                        },
                        firstButtonText: AppWordManger.home,
                        secoundButtonText: AppWordManger.cancle,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
