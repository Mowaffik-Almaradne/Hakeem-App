import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hosptel_app/app/my_app.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/features/notification/presentation/logic/fire_base_notification.dart';
import 'package:hosptel_app/firebase_options.dart';
import 'package:hosptel_app/injection/injection_container.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

void main() async {
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  SharedPreferences.getInstance().then(
    (pref) {
      AppSharedPreferences.init(pref);
      String token = AppSharedPreferences.getToken();
      if (token.isNotEmpty && JwtDecoder.isExpired(token)) {
        AppSharedPreferences.logoutSharedPreferences();
      }
      runApp(MyApp());
    },
  );
}
