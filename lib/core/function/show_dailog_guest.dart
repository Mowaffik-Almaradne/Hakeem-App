import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import 'package:hosptel_app/core/widget/show_dialog/main_show_dialog_widget.dart';
import 'package:hosptel_app/router/app_router.dart';

//? For Guest :
void showDialogForGuest(BuildContext context) {
  MainShowDialog.customShowDialog(
    barrierDismissible: false,
    textPopUp: AppWordManger.yourLoginHasExpired,
    context,
    firstButtonText: AppWordManger.continueAsGuest,
    secoundButtonText: AppWordManger.login,
    onTapFirst: () {
      AppSharedPreferences.logoutSharedPreferences();
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNamedScreens.homeScreenNameRoute,
        (route) => route.isFirst,
      );
    },
    onTapSecound: () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNamedScreens.loginScreenNameRoute,
        (route) => false,
      );
    },
  );
}

void showDialogForNotification(
    {required BuildContext context,
    required String title,
    required String body}) {
  MainShowDialog.customShowDialog(
    barrierDismissible: false,
    textPopUp: "$title\n$body",
    isRow: false,
    context,
    firstButtonText: AppWordManger.cancle,
    secoundButtonText: AppWordManger.notification,
    onTapFirst: () {
      Navigator.pop(context);
    },
    onTapSecound: () {
      context.read<ButtonNavCubit>().changeIndexButtonNav(1, context);
    },
  );
}

//? For Reservation :
void showDialogForResrvation(BuildContext context) {
  MainShowDialog.customShowDialog(
    isRow: false,
    textPopUp: AppWordManger.doneReservationSucces,
    context,
    firstButtonText: AppWordManger.home,
    secoundButtonText: AppWordManger.myReservation,
    onTapFirst: () {
      context.read<ButtonNavCubit>().changeIndexButtonNav(2, context);
    },
    onTapSecound: () {
      context.read<ButtonNavCubit>().changeIndexButtonNav(3, context);
    },
  );
}
