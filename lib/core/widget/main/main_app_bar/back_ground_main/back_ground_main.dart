import 'package:flutter/material.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/nav_button_main.dart';

class MainBackGround extends StatelessWidget {
  const MainBackGround({
    super.key,
    required this.mainBody,
    this.appBar,
    this.bottomSheet,
    this.backgroundColor,
  });
  final Widget mainBody;
  final Widget? bottomSheet;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomSheet: bottomSheet,
      appBar: appBar,
      bottomNavigationBar: const MainButtonNavigation(),
      body: SafeArea(
        child: mainBody,
      ),
    );
  }
}
