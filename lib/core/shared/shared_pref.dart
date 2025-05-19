import 'package:hosptel_app/core/entity/decode_token_entity.dart';
import 'package:hosptel_app/core/resources/keys_manger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static late SharedPreferences _sharedPreferences; // instance

  static init(SharedPreferences sh) {
    _sharedPreferences = sh;
  }

  static clear() {
    _sharedPreferences.clear();
  }

  //? Make Logout And Clear All The Keys And All Values Stored
  static void logoutSharedPreferences() {
    _sharedPreferences.remove(AppKeysManger.token);
    _sharedPreferences.remove(AppKeysManger.userId);
  }

  //! Start Cash Sheard Pref : //!
  //? Cash Token :
  static void cashToken({required String token}) {
    _sharedPreferences.setString(AppKeysManger.token, token);
  }

//? Cash Use Id :
  static void cashIdUser({required int id}) {
    _sharedPreferences.setInt(AppKeysManger.userId, id);
  }

  //? Cash Use Id :
  static void cashUserName({required String userName}) {
    _sharedPreferences.setString(AppKeysManger.userName, userName);
  }

  //? Cash Use Id :
  static void cashPhoneUser({required String phone}) {
    _sharedPreferences.setString(AppKeysManger.userPhone, phone);
  }

  static void cashGeneralSetting(
      {required bool isDisplayAttachments,
      required bool isDisplayPrescription,
      required bool isDisplaySessions,
      required bool isDisplayAccounts}) {
    _sharedPreferences.setBool(
        AppKeysManger.isDisplayAttachments, isDisplayAttachments);
    _sharedPreferences.setBool(
        AppKeysManger.isDisplayPrescription, isDisplayPrescription);
    _sharedPreferences.setBool(
        AppKeysManger.isDisplaySessions, isDisplaySessions);
    _sharedPreferences.setBool(
        AppKeysManger.isDisplayAccounts, isDisplayAccounts);
  }

  //! Finish Cash Sheard //!

  //! Start Get Sheard Pref //!

  static String getToken() {
    return _sharedPreferences.getString(AppKeysManger.token) ?? "";
  }

  static int getUserId() {
    return _sharedPreferences.getInt(AppKeysManger.userId) ?? 0;
  }

  static String getUserName() {
    return _sharedPreferences.getString(AppKeysManger.userName) ??
        DecodeTokenEntity.getData().name;
  }

  static String getPhoneUser() {
    return _sharedPreferences.getString(AppKeysManger.userPhone) ??
        DecodeTokenEntity.getData().phoneNumber;
  }

  //? Gneral Settings :
  static bool getDisplayAttachments() {
    return _sharedPreferences.getBool(AppKeysManger.isDisplayAttachments) ??
        false;
  }

  static bool getisDisplayPrescription() {
    return _sharedPreferences.getBool(AppKeysManger.isDisplayPrescription) ??
        false;
  }

  static bool getisisDisplaySessions() {
    return _sharedPreferences.getBool(AppKeysManger.isDisplaySessions) ?? false;
  }

  static bool getDisplayAccounts() {
    return _sharedPreferences.getBool(AppKeysManger.isDisplayAccounts) ?? false;
  }
  //! End Get Sheard Pref //!
}
