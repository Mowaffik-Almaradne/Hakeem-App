import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/core/widget/show_dialog/main_show_dialog_widget.dart';
import 'package:hosptel_app/router/app_router.dart';

EdgeInsetsGeometry paddingWordUnSelected({
  required int index,
  required selectedIndex,
}) {
  if (selectedIndex != index) {
    return EdgeInsets.only(top: 15.h);
  } else {
    return const EdgeInsets.only(top: 0.0);
  }
}

//? function for change color as soon as active :
Color changeColorIconFun({
  required int index,
  required selectedIndex,
}) {
  return selectedIndex == index
      ? AppColorManger.white
      : AppColorManger.primaryColor;
}

//? function for remove label text as soon as active :
String removeLabelIconFun({
  required int index,
  required selectedIndex,
  required String labelWord,
}) {
  return selectedIndex == index ? '' : labelWord;
}

//? Function Tap For Tap :
bool forGuestUserTap(int value, BuildContext context) {
  if (AppSharedPreferences.getToken().isEmpty && value != 2) {
    MainShowDialog.customShowDialog(
      isRow: false,
      firstButtonText: AppWordManger.notUntil,
      secoundButtonText: AppWordManger.login,
      textPopUp: AppWordManger.loginMustFirst,
      context,
      onTapFirst: () {
        Navigator.pop(context);
      },
      onTapSecound: () {
        Navigator.pushReplacementNamed(
            context, RouteNamedScreens.loginScreenNameRoute);
      },
    );
    return false;
  }
  return true;
}
