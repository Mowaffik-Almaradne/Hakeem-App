import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainLoadignWidget extends StatelessWidget {
  const MainLoadignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
  }
}
