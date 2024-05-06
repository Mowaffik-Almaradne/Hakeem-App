import 'package:flutter/material.dart';
import 'package:hosptel_app/router/app_router.dart';

//? Navigation For Pages :
void routingNamePage(int index, BuildContext context) {
  switch (index) {
    //? Health Page :
    case 0:
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNamedScreens.healthNameRoute,
        (route) => false,
      );
      break;
    //? My Notification Page :
    case 1:
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNamedScreens.notificationNameRoute,
        (route) => false,
      );
      break;
    //? Home Page :
    case 2:
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNamedScreens.homeSecoundryScreenNameRoute,
        (route) => false,
      );
      break;
    //? Reservation Now :
    case 3:
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNamedScreens.reservationNameRoute,
        (route) => false,
      );
      break;
    //? Profile Page :
    case 4:
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNamedScreens.profileNameRoute,
        (route) => false,
      );
      break;
  }
}
