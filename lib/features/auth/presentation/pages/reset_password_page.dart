import 'package:flutter/material.dart';
import 'package:hosptel_app/core/resources/png_manger.dart';
import 'package:hosptel_app/features/auth/presentation/logic/auth_logic.dart';
import 'package:hosptel_app/features/auth/presentation/widget/bottome_sheet_reset_password.dart';

class ResetForgetPassword extends StatelessWidget {
  final InfoForgetPassword data;
  const ResetForgetPassword({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppPngManger.backGroundLoginPage),
          ),
        ),
      ),
      bottomSheet: BottomeSheetResetPassword(
        data: data,
      ),
    );
  }
}
