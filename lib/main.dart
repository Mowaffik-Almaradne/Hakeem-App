import 'package:flutter/material.dart';
import 'package:hosptel_app/app/my_app.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/injection/injection_container.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then(
    (pref) {
      AppSharedPreferences.init(pref);
      runApp(MyApp());
    },
  );
}
