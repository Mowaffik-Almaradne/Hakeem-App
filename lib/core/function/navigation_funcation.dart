import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import 'package:hosptel_app/core/widget/show_dialog/main_show_dialog_widget.dart';
import 'package:hosptel_app/router/app_router.dart';

//? Navigation For Pages :
void routingNamePage(int index, BuildContext context) {
  switch (index) {
    //? Health Page :
    case 0:
      isGustOrUserMethode(
        context,
        routeNmae: RouteNamedScreens.healthNameRoute,
      );
      break;
    //? My Notification Page :
    case 1:
      isGustOrUserMethode(
        context,
        routeNmae: RouteNamedScreens.notificationNameRoute,
      );
      break;
    //? Home Page :
    case 2:
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNamedScreens.homeScreenNameRoute,
        (route) => false,
      );
      break;
    //? Reservation Now :
    case 3:
      isGustOrUserMethode(
        context,
        routeNmae: RouteNamedScreens.reservationNameRoute,
      );

      break;
    //? Profile Page :
    case 4:
      isGustOrUserMethode(
        context,
        routeNmae: RouteNamedScreens.profileNameRoute,
      );
      break;
  }
}

//? Function For Is Gust Or User For Navigation :
void isGustOrUserMethode(BuildContext context, {required String routeNmae}) {
  if (AppSharedPreferences.getToken().isEmpty) {
    MainShowDialog.customShowDialog(
      barrierDismissible: false,
      onTapBack: () {
        context.read<ButtonNavCubit>().changeIndexButtonNav(2, context);
      },
      hieght: 150.h,
      context,
      onTapFirst: () {
        context.read<ButtonNavCubit>().changeIndexButtonNav(2, context);
      },
      onTapSecound: () {
        Navigator.pushReplacementNamed(
            context, RouteNamedScreens.loginScreenNameRoute);
      },
      firstButtonText: AppWordManger.notUntil,
      secoundButtonText: AppWordManger.login,
      textPopUp: AppWordManger.loginMustFirst,
    );
  } else {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeNmae,
      (route) => false,
    );
  }
}
