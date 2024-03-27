
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/nav_button_main.dart';
import 'package:hosptel_app/router/app_router.dart';
//? function for padding word
EdgeInsetsGeometry paddingWordUnSelected({required int index}) {
  if (selectedIndex != index) {
    return EdgeInsets.only(top: 15.h);
  } else {
    return const EdgeInsets.only(top: 0.0);
  }
}

//? function for change color as soon as active :
Color changeColorIconFun(int index) {
  return selectedIndex == index
      ? AppColorManger.white
      : AppColorManger.primaryColor;
}

//? function for remove label text as soon as active :
String removeLabelIconFun(int index, String labelWord) {
  return selectedIndex == index ? '' : labelWord;
}

//? function for Routing Page :

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
