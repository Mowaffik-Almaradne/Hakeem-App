import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';

//! them app use this is for (dark theme or light theme switched)
Color subTextColor = AppColorManger.white;
final appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    centerTitle: true,
  ),
  brightness: Brightness.light,
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.tajawal(
      color: AppColorManger.white,
      fontSize: AppFontSizeManger.s24,
      fontWeight: AppFontWeightManger.fontWeightBold,
    ),
    bodySmall: GoogleFonts.tajawal(
      color: AppColorManger.white,
      fontSize: AppFontSizeManger.s16,
      fontWeight: AppFontWeightManger.fontWeightRagularBold,
    ),
    displayMedium: GoogleFonts.tajawal(
      color: AppColorManger.white,
      fontSize: AppFontSizeManger.s24,
      fontWeight: AppFontWeightManger.fontWeightExtraBold,
    ),
    displaySmall: GoogleFonts.tajawal(
      color: AppColorManger.white,
      fontSize: AppFontSizeManger.s10,
      fontWeight: AppFontWeightManger.fontWeightRagularBold,
    ),
    labelSmall: GoogleFonts.tajawal(
      color: AppColorManger.black,
      fontSize: AppFontSizeManger.s13,
      fontWeight: AppFontWeightManger.fontWeightRagularBold,
    ),
  ),
);
