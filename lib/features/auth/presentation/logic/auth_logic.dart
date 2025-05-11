import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import 'package:hosptel_app/core/widget/sanck_bar/main_snack_bar.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/confirm_account/confirm_account_state.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/confirm_forget_password_cubit/confirm_forget_password_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/create_Account_cubit/create_account_state.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/forget_password_phone_cubit/forget_password_phone_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/resend_code_cubit/resend_code_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/reset_password_cubit.dart/reset_password_cubit.dart';
import 'package:hosptel_app/router/app_router.dart';

class AuthLogic {
  //? For Create Accoun :
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
        RouteNamedScreens.confirmAccountNameRoute,
        arguments: phoneNumber,
      );
    }
  } //?

  //? For Login :
  void listenerForLogin(
      LoginState state, BuildContext context, String phoneNumber) {
    if (state.status == DeafultBlocStatus.done) {
      context.read<ButtonNavCubit>().changeIndexButtonNav(2, context);
    } else if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
        message: state.failureMessage.message,
        context: context,
      );
    }
    if (state.failureMessage.details == "True" &&
        state.status == DeafultBlocStatus.error) {
      context.read<ResendCodeCubit>().resendCode(phoneNumber: phoneNumber);
      Timer(
        const Duration(seconds: 1),
        () {
          Navigator.pushNamed(
            arguments: phoneNumber,
            context,
            RouteNamedScreens.confirmAccountNameRoute,
          );
        },
      );
    }
  } //?

  //? Confirm Code :
  void listenerConfirmCode(ConfirmAccountState state, BuildContext context) {
    if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
        message: state.failureMessage.message,
        context: context,
      );
    } else if (state.status == DeafultBlocStatus.done) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNamedScreens.loginScreenNameRoute,
        (route) => false,
      );
    }
  } //?

  //? Forget Pasword Phone Listener :
  void listenerForgetPasswordPhone(ForgetPasswordPhoneState state,
      BuildContext context, String phoneNumber) {
    if (state.status == DeafultBlocStatus.done) {
      Navigator.pushNamed(
          context, RouteNamedScreens.confirmAForgetPasswordNameRoute,
          arguments: phoneNumber);
    } else if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
        message: state.failureMessage.message,
        context: context,
      );
    }
  }

  //? Confirme Pasword Phone Listener :
  void listenerConfirmForgetPasswordPhone(
    ConfirmForgetPasswordState state,
    BuildContext context,
    InfoForgetPassword infoForget,
  ) {
    if (state.status == DeafultBlocStatus.done) {
      Navigator.pushNamed(
        context,
        RouteNamedScreens.resetPasswordNmaeRoute,
        arguments: infoForget,
      );
    } else if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
        message: state.failureMessage.message,
        context: context,
      );
    }
  } //?

  //? Rest Passwod Listener  :
  void listenerResetPassword(ResetPasswordState state, BuildContext context) {
    if (state.status == DeafultBlocStatus.done) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNamedScreens.loginScreenNameRoute,
        (route) => false,
      );
    } else if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
        message: state.failureMessage.message,
        context: context,
      );
    }
  } //?
}

//? Object For Pass Argumant :
class InfoForgetPassword {
  final String phoneNumber;
  final String code;

  InfoForgetPassword({required this.phoneNumber, required this.code});
}
