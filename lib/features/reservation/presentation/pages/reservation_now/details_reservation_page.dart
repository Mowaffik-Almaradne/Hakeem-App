import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/main/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/reservation_details/info_day_weak_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/reservation_details/app_bar_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/reservation_details/info_day_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/reservation_details/info_time_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/reservation_details/label_text_time_day_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/reservation_details/label_text_widget.dart';
import 'package:hosptel_app/router/app_router.dart';

class DetailesReservationPage extends StatelessWidget {
  const DetailesReservationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainBackGround(
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
              text: AppWordManger.reservationAvilable,
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
            const InfoDayWidget(),
            //? Label Text Time :
            const LabelTextSlider(
              name: AppWordManger.time,
            ),
            //? Info Time :
            const InfoTimesWidget(),

            //? Button Ensure Resevation :
            Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 40.h),
              child: MainElevatedButton(
                text: AppWordManger.reservationConfarmation,
                backgroundColor: AppColorManger.primaryColor,
                textColor: AppColorManger.white,
                onPreesed: () {
                  Navigator.pushNamed(
                    context,
                    RouteNamedScreens.reservationSummaryNameRoute,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
