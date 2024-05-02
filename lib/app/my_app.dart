import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/theme/them_app.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import 'package:hosptel_app/router/app_router.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return BlocProvider(
           create: (context) => ButtonNavCubit(),
          child: MaterialApp(
            onGenerateRoute: appRouter.onGenerateRoute,
            debugShowCheckedModeBanner: false,
            theme: appTheme,
          ),
        );
      },
      designSize: const Size(360, 740),
      splitScreenMode: true,
      minTextAdapt: true,
    );
  }
}
