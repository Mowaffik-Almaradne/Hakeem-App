import 'package:flutter/material.dart';
import 'package:hosptel_app/core/resources/png_manger.dart';
import 'package:hosptel_app/features/auth/presentation/widget/bottome_sheet_login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppPngManger.backGroundSignUpPage),
          ),
        ),
      ),
      bottomSheet: const BottomeSheetLoginWidget(),
    );
  }
}
