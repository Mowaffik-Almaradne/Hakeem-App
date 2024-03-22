import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/router/app_router.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          onGenerateRoute: appRouter.onGenerateRoute,
          debugShowCheckedModeBanner: false,
        );
      },
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
    );
  }
}
//          theme: appTheme,