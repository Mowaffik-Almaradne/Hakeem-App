import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/app/my_app.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider(
      create: (context) => ButtonNavCubit(),
      child: MyApp(),
    ),
  );
}
