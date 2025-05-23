import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/main/main_app_bar/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/repeted/titel_pages_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/get_all_my_reservation_cubit/get_all_my_reservation_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/my_reservation/finshied_reservation.dart';
import 'package:hosptel_app/core/widget/tab_bar/tab_bar_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/my_reservation/watting_reservation_widget.dart';
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
        initialIndex: 1,
        child: MainBackGround(
          mainBody:
              BlocBuilder<GetAllMyReservationCubit, GetAllMyReservationState>(
            builder: (context, state) {
              return Column(
                children: [
                  //? Title Reservation :
                  const TitlePageWidget(
                    titleText: AppWordManger.myReservation,
                  ),
                  //? Tab Bar Widget  :
                  TabBarWidget(
                    onTap: (index) {
                      if (index == 0 && !state.hasTapped) {
                        context.read<GetAllMyReservationCubit>().hasTapped();
                        context
                            .read<GetAllMyReservationCubit>()
                            .getAllMyReservation(
                                isEnded: true, isRefresh: true);
                      }
                    },
                  ),
                  const Expanded(
                    flex: 1,
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        //? Resevation Finished :
                        FinshiedReservationWidget(),
                        //? Resevation As Soon As Wating  :
                        WattingReservationWidget(),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
