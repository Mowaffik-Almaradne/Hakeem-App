import 'package:flutter/material.dart';
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
    //? My Notification Page :
    case 1:
      isGustOrUserMethode(
        context,
        routeNmae: RouteNamedScreens.notificationNameRoute,
      );
    //? Home Page :
    case 2:
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNamedScreens.homeScreenNameRoute,
        (route) => route.isFirst,
      );

    //? Reservation Now :
    case 3:
      isGustOrUserMethode(
        context,
        routeNmae: RouteNamedScreens.reservationNameRoute,
      );
    //? Profile Page :
    case 4:
      isGustOrUserMethode(
        context,
        routeNmae: RouteNamedScreens.profileNameRoute,
      );
  }
}

//? Function For Is Gust Or User For Navigation :
void isGustOrUserMethode(BuildContext context, {required String routeNmae}) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    routeNmae,
    (route) => route.isFirst,
  );
}
