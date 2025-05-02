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
  //! Finish Cash Sheard //!

  //! Start Get Sheard Pref //!

  static String getToken() {
    return _sharedPreferences.getString(AppKeysManger.token) ?? "";
  }

  static int getUserId() {
    return _sharedPreferences.getInt(AppKeysManger.userId) ?? 0;
  }
  //! End Get Sheard Pref //!
}
