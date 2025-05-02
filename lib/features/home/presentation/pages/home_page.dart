import 'package:double_back_to_exit/non_web_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/main/main_app_bar/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/features/advertisement/presentation/cubit/advertisement_cubit.dart';
import 'package:hosptel_app/features/advertisement/presentation/widgets/lis_item_advertasment.dart';
import 'package:hosptel_app/features/doctor/presentation/widget/info_doctor_text.dart';
import 'package:hosptel_app/features/doctor/presentation/widget/info_doctor_widget.dart';
import 'package:hosptel_app/features/home/presentation/widgets/home_primary/caption_text_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/in_home/reservation_now_button_widget.dart';
import 'package:hosptel_app/features/services/presentation/cubit/services_cubit.dart';
import 'package:hosptel_app/features/services/presentation/widgets/srviecs_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return DoubleBackToExitWidget(
      backgroundColor: AppColorManger.primaryColor,
      behavior: SnackBarBehavior.floating,
      width: 280.w,
      padding: EdgeInsets.only(bottom: 15.h, top: 15.h),
      snackBarMessage: AppWordManger.preesAnotherForExit,
      textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 15.sp,
          ),
      child: MainBackGround(
        mainBody: SingleChildScrollView(
          child: Column(
            children: [
              //? Info Doctor :
              const InfoDoctorWidget(),
              //? button reservation Now :
              RefreshIndicator(
                onRefresh: () async {
                  context
                      .read<GetAllServicesCubit>()
                      .getAllServices(isRefresh: true);
                  context
                      .read<GetAllAdvertisementCubit>()
                      .getAllAdvertisement(isRefresh: true);
                },
                child: SizedBox(
                  height: 350.h,
                  child: ListView(
                    children: [
                      const ReservationNowButtonWidget(
                        text: AppWordManger.reservationNow,
                      ),
                      //? about doctor label :
                      const CaptionTextWidget(
                        text: AppWordManger.aboutDoctor,
                      ),

                      //? about doctor
                      const InfoDoctorText(),

                      //? Services :
                      CaptionTextWidget(
                        padding:
                            EdgeInsets.only(left: 19.w, right: 19.w, top: 10.h),
                        text: AppWordManger.services,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.w,
                        ),
                        child: const InfoServicesListWidget(),
                      ),
                      //? Advertasment :
                      const CaptionTextWidget(
                        text: AppWordManger.tipsAndNews,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.w,
                        ),
                        child: const ListIteamAdvertisementWidget(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
