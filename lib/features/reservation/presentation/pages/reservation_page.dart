import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/main/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import 'package:hosptel_app/core/widget/repeted/titel_pages_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/card_reservation_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/pop_up_cancle_reservation.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/tab_bar_widget.dart';
import 'package:hosptel_app/router/app_router.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Navigator.pushReplacementNamed(
          context,
          RouteNamedScreens.homeScreenNameRoute,
        );
        context.read<ButtonNavCubit>().changeIndexButtonNav(2, context);
      },
      child: DefaultTabController(
        length: 2,
        child: MainBackGround(
          mainBody: Column(
            children: [
              //? Title Reservation :
              const TitlePageWidget(
                titleText: AppWordManger.myReservation,
              ),
              //? Tab Bar Widget  :
              const TabBarWidget(),
              Expanded(
                flex: 1,
                child: TabBarView(
                  children: [
                    //? Resevation Finished :
                    const CardReservationWidget(
                      iconCardReservatio: AppSvgManger.iconFinishedResevation,
                      showButtonCancleResvation: false,
                      showDivider: false,
                    ),
                    //? Resevation As Soon As Wating  :
                    CardReservationWidget(
                      iconCardReservatio: AppSvgManger.iconReservation,
                      showButtonCancleResvation: true,
                      showDivider: true,
                      onTapCancleReservation: () {
                        MainShowDialogCansleResevation.customShowDialog(
                          context,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
