import 'package:flutter/material.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/widget/sanck_bar/main_snack_bar.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/create_Account/create_account_state.dart';
import 'package:hosptel_app/router/app_router.dart';

class AuthLogic {
  void listenerCreateAccount(
    CreateAccountState state,
    BuildContext context,
    String phoneNumber,
  ) {
    if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
          message: state.failureMessage.message, context: context);
    } else if (state.status == DeafultBlocStatus.done) {
      Navigator.pushNamed(
        context,
        RouteNamedScreens.reciveNumberVerificationPageScreenNameRoute,
        arguments: phoneNumber,
      );
    }
  }
}
