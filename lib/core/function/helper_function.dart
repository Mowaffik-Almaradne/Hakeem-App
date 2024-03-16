import 'package:flutter/material.dart';

//! function navigation to any page
void navigationPage(BuildContext context, {required String page}) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    page,
    (route) => false,
  );
}
