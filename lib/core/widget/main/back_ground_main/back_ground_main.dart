import 'package:flutter/material.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/nav_button_main.dart';

class MainBackGround extends StatelessWidget {
  const MainBackGround({
    super.key,
    required this.mainBody,
  });
  final Widget mainBody;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MainButtonNavigation(),
      body: SafeArea(
        child: mainBody,
      ),
    );
  }
}
