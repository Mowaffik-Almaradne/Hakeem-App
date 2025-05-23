import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class EmptyInfoNotification extends StatelessWidget {
  const EmptyInfoNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return TextUtiels(
      paddingTop: 120.h,
      text: AppWordManger.thereAreNoNotificationsYet,
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: 24.sp,
          ),
    );
  }
}
