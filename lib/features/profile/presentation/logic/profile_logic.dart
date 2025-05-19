import 'package:flutter/material.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/sanck_bar/main_snack_bar.dart';
import 'package:hosptel_app/features/profile/domain/entities/res/patient_profile_entitiey.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/change_password_cubit/change_password_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/confirm_edit_phone_number_cubit/confirm_edit_phone_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/delete_account_cubit/delete_account_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/logout_cubit/logout_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/send_confirmation_code_for_edit_number_cubit/send_confirmation_code_for_edit_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/updata_patient_profile_cubit/updata_patient_profile_cubit.dart';
import 'package:hosptel_app/router/app_router.dart';

class ProfileLogic {
  //? For Change Passwprd  :
  void listenerChangePassword(
      {required ChangePasswordState state, required BuildContext context}) {
    if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
          message: state.failureMessage.message, context: context);
    } else if (state.status == DeafultBlocStatus.done) {
      Navigator.pop(context);
    }
  } //?

  //? For Change Passwprd  :
  void listenerEditPhoneNumber({
    required SendConfirmationCodeForEditNumberState state,
    required BuildContext context,
    required String phoneNumber,
  }) async {
    if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
          message: state.failureMessage.message, context: context);
    } else if (state.status == DeafultBlocStatus.done) {
      final data = await Navigator.pushNamed(
        context,
        RouteNamedScreens.verificationEditNumberNameRoute,
        arguments: phoneNumber,
      ) as String;
      phoneNumber = data;
    }
  } //?

//? For Confirm Edit Phone Number  :
  void listenerConfirmEditPhoneNumber({
    required ConfirmEditPhoneNumberState state,
    required BuildContext context,
    required String phoneNumber,
  }) {
    if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
          message: state.failureMessage.message, context: context);
    } else if (state.status == DeafultBlocStatus.done) {
      AppSharedPreferences.cashPhoneUser(phone: phoneNumber);
      Navigator.pop(context, '');
      Navigator.pop(context);
    }
  } //?

  //? For Logout  :
  void listenelogout(
      {required LogoutState state, required BuildContext context}) {
    if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
          message: state.failureMessage.message, context: context);
    } else if (state.status == DeafultBlocStatus.done) {
      AppSharedPreferences.logoutSharedPreferences();
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNamedScreens.loginScreenNameRoute,
        (route) => false,
      );
    }
  } //?

  //? For Confirm Edit Phone Number  :
  void listenerProfileInfo(
      {required UpdataPatientProfileState state,
      required BuildContext context,
      required MainPatientProfile request}) {
    if (state.status == DeafultBlocStatus.error) {
      SnackBarUtil.showSnackBar(
          message: state.failureMessage.message, context: context);
    } else if (state.status == DeafultBlocStatus.done) {
      AppSharedPreferences.cashUserName(userName: request.fullName);
      Navigator.pop(context);
    }
  } //?

  //? For Confirm Edit Phone Number  :
  void listenerDeleteAccount(
      {required DeleteAccountState state, required BuildContext context}) {
    Navigator.pop(context);
    if (state.status == DeafultBlocStatus.loading) {
      showDialog(
        context: context,
        builder: (context) {
          return const SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: MainLoadignWidget(),
            ),
          );
        },
      );
    } else if (state.status == DeafultBlocStatus.done) {
      AppSharedPreferences.logoutSharedPreferences();
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNamedScreens.introScreenNameRoute,
        (route) => false,
      );
    }
  } //?
}
