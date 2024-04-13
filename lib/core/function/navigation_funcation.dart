import 'package:flutter/material.dart';
import 'package:hosptel_app/router/app_router.dart';

//? Navigation For Pages : 
void routingNamePage(int index, BuildContext context) {
  switch (index) {
    case 0:
      Navigator.pushReplacementNamed(
          context, RouteNamedScreens.healthNameRoute);
      break;
    case 1:
      Navigator.pushReplacementNamed(
          context, RouteNamedScreens.notificationNameRoute);
      break;
    case 2:
      Navigator.pushReplacementNamed(
          context, RouteNamedScreens.homeScreenNameRoute);
      break;
    case 3:
      Navigator.pushReplacementNamed(
          context, RouteNamedScreens.reservationNameRoute);
      break;
    case 4:
      Navigator.pushReplacementNamed(
          context, RouteNamedScreens.profileNameRoute);
      break;
  }
}
