import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/core/theme/them_app.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import 'package:hosptel_app/features/general_setting/presentation/cubit/general_setting_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/logout_cubit/logout_cubit.dart';
import 'package:hosptel_app/router/app_router.dart';
import 'package:hosptel_app/injection/injection_container.dart' as di;
import 'package:jwt_decoder/jwt_decoder.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    String token = AppSharedPreferences.getToken();

    return ScreenUtilInit(
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ButtonNavCubit(),
            ),
            BlocProvider(
              create: (context) => di.sl<LogoutCubit>(),
            ),
            if (token.isNotEmpty) ...[
              BlocProvider(
                lazy: false,
                create: (context) =>
                    di.sl<GeneralSettingCubit>()..getGeneralSetting(),
              ),
            ],
            if (token.isNotEmpty && JwtDecoder.isExpired(token)) ...[
              BlocProvider(
                create: (context) => di.sl<LogoutCubit>()..logout(),
              ),
            ],
          ],
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
