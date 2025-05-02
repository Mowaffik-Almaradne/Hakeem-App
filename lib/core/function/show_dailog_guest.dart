import 'package:flutter/material.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
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

//? For Reservation :
void showDialogForResrvation(BuildContext context) {
  MainShowDialog.customShowDialog(
      textPopUp: AppWordManger.doneReservationSucces,
      context,
      firstButtonText: AppWordManger.home,
      secoundButtonText: AppWordManger.myReservation, onTapFirst: () {
    Navigator.restorablePushNamedAndRemoveUntil(
      context,
      RouteNamedScreens.healthNameRoute,
      (route) => route.isFirst,
    );
  }, onTapSecound: () {
    Navigator.pushReplacementNamed(
      context,
      RouteNamedScreens.reservationNameRoute,
    );
  });
}
