import 'package:flutter/material.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';

//! them app use this is for (dark theme or light theme switched)
final appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    centerTitle: true,
  ),
  colorScheme: ColorScheme.light(
    primary: AppColorManger.primaryColor,
  ),
  dialogBackgroundColor: const Color.fromARGB(161, 255, 255, 255),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontFamily: AppFontFamily.tajawalBold,
      color: AppColorManger.white,
    ),
    bodyMedium: TextStyle(
      fontFamily: AppFontFamily.tajawalMedium,
      color: AppColorManger.white,
    ),
    bodySmall: TextStyle(
      fontFamily: AppFontFamily.tajawalRegular,
      color: AppColorManger.primaryColor,
    ),
    displayMedium: TextStyle(
      fontFamily: AppFontFamily.tajawalLight,
      color: AppColorManger.black,
    ),
    displayLarge: TextStyle(
      fontFamily: AppFontFamily.tajawalBold,
      color: AppColorManger.primaryColor,
    ),
    labelLarge: TextStyle(
      fontFamily: AppFontFamily.tajawalBold,
      color: AppColorManger.black,
    ),
    labelSmall: TextStyle(
      fontFamily: AppFontFamily.tajawalRegular,
      color: AppColorManger.textColor2,
    ),
  ),
);
