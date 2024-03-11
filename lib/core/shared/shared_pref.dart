//! file all sheard prefrinces application (soon use this !!!!)

// import 'package:shared_preferences/shared_preferences.dart';

// import '../strings/keys_manger.dart';

// class AppSharedPreferences {
//   static late SharedPreferences _sharedPreferences; // instance

//   static init(SharedPreferences sh) {
//     _sharedPreferences = sh;
//   }

//   static clear() {
//     _sharedPreferences.clear();
//   }

//   // Register Token & UserId & Username
//   static void cacheAuthUserInfo({
//     required String accToken,
//     required String username,
//     required int userId,
//     required String roles,
//   }) {
//     _sharedPreferences.setString(AppKeysManger.ACC_TOKEN, accToken);
//     _sharedPreferences.setInt(AppKeysManger.USER_ID, userId);
//     _sharedPreferences.setString(AppKeysManger.USER_NAME, username);
//     _sharedPreferences.setString(AppKeysManger.ROLES, roles);
//   }

//   static void deleteCacheAuthUserInfo() {
//     _sharedPreferences.remove(AppKeysManger.ACC_TOKEN);
//     _sharedPreferences.remove(AppKeysManger.USER_ID);
//     _sharedPreferences.remove(AppKeysManger.USER_NAME);
//     _sharedPreferences.remove(AppKeysManger.REMEMBER_ME);
//     _sharedPreferences.remove(AppKeysManger.ROLES);
//     _sharedPreferences.remove(AppKeysManger.VENDOR_ID);
//   }

// // Cache Vendor Info
//   static void cacheVendorInfo({required int vendorId}) {
//     _sharedPreferences.setInt(AppKeysManger.VENDOR_ID, vendorId);
//   }

//   // Register Remember Me Value
//   static void cacheRememberMeValue(bool isRememberMe) {
//     _sharedPreferences.setBool(AppKeysManger.REMEMBER_ME, isRememberMe);
//   }

//   // Register Intro Of App If It's Open
//   static void setIntroAsOpened(bool isOpened) {
//     _sharedPreferences.setBool(AppKeysManger.IS_INTRO_OPEN, isOpened);
//   }

//   // Get Intro Is Open Value
//   static bool isIntroOpen() {
//     return _sharedPreferences.getBool(AppKeysManger.IS_INTRO_OPEN) ?? false;
//   }

//   // Get Token If It Registered Or Return Empty Value ''
//   static String getAccToken() {
//     return _sharedPreferences.getString(AppKeysManger.ACC_TOKEN) ?? '';
//   }

//   // Get Roles Or Return Empty Value ''
//   static String getRoles() {
//     return _sharedPreferences.getString(AppKeysManger.ROLES) ?? '';
//   }

//   // Get User Id If Registered Or Return Zero Value 0
//   static int getUserId() {
//     return _sharedPreferences.getInt(AppKeysManger.USER_ID) ?? 0;
//   }

//   // Get Vendor Id Or Return Zero Value 0
//   static int getVendorId() {
//     return _sharedPreferences.getInt(AppKeysManger.VENDOR_ID) ?? 0;
//   }

//   // Get User Name If Registered Or Return Zero Value 0
//   static String getUserName() {
//     return _sharedPreferences.getString(AppKeysManger.USER_NAME) ?? '';
//   }

//   // Get Remember Me Value For Auto Login
//   static bool getRememberMeValue() {
//     return _sharedPreferences.getBool(AppKeysManger.REMEMBER_ME) ?? false;
//   }

//   // Make Logout And Clear All The Keys And All Values Stored
//   static void logoutSharedPreferences() {
//     _sharedPreferences.clear();
//   }
// }
