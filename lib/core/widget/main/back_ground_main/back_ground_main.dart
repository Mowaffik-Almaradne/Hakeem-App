// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/nav_button_main.dart';

class MainBackGround extends StatelessWidget {
  const MainBackGround(
      {super.key, required this.mainBody, this.appBar, this.onWillPop});
  final Widget mainBody;
  final PreferredSizeWidget? appBar;
  final Future<bool> Function()? onWillPop;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: appBar,
        bottomNavigationBar: const MainButtonNavigation(),
        body: SafeArea(
          child: mainBody,
        ),
      ),
    );
  }
}
