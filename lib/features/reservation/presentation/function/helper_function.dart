import 'dart:ui';
import 'package:hosptel_app/core/resources/color_manger.dart';

class StateResevation {
  //? For Back Ground :
  Color changeStateReservationBackGround(
      {required bool isSelect, required bool isReservation}) {
    if (isSelect == true) {
      return AppColorManger.primaryColor;
    } else if (isReservation == true) {
      return AppColorManger.colorButtonShowDailog;
    } else {
      return AppColorManger.white;
    }
  }

//? For Back Text :
  Color changeStateReservationText(
      {required bool isSelect, required bool isReservation}) {
    if (isSelect == true) {
      return AppColorManger.white;
    } else if (isReservation == true) {
      return AppColorManger.primaryColor;
    } else {
      return AppColorManger.black;
    }
  }

//? For Back Border :
  Color changeStateReservationBorder(
      {required bool isSelect, required bool isReservation}) {
    if (isSelect == true) {
      return AppColorManger.primaryColor;
    } else if (isReservation == true) {
      return AppColorManger.colorTransparnt;
    } else {
      return AppColorManger.primaryColor;
    }
  }
}
