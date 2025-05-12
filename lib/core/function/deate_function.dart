import 'dart:developer';

import 'package:flutter/material.dart';

//? Select Date :
Future<void> selecteDate(
    BuildContext context, TextEditingController controller) async {
  //? Parse the current text field value to set as initialDate
  // Parse the current text field value to set as initialDate
  DateTime initialDate = DateTime.now();

  if (controller.text.isNotEmpty) {
    try {
      // Attempt to parse the date with a specific format
      initialDate = DateTime.parse(controller.text);
    } catch (e) {
      log(e.toString());
    }
  }
  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(1700),
    lastDate: DateTime(2100),
  );

  if (selectedDate != null) {
    controller.text = selectedDate.toIso8601String().substring(0, 10);
  }
}
