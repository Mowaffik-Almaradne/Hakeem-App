import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hosptel_app/core/function/navigation_funcation.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_state.dart';

class ButtonNavCubit extends Cubit<ButtonNavBarState> {
  ButtonNavCubit() : super(ButtonNavBarState.intial());

  void changeIndexButtonNav(int index, BuildContext context) {
    routingNamePage(index, context);
    emit(state.copyWith(buttonNavBarIndex: index));
  }
}
