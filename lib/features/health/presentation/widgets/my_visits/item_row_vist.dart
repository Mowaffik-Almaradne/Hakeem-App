
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class RowItemVist extends StatelessWidget {
  const RowItemVist({
    super.key,
    this.padding,
    required this.primatyText,
    required this.secoundryText,
    this.paddingForText,
  });
  final EdgeInsetsGeometry? padding;
  final String primatyText;
  final String secoundryText;
  final double? paddingForText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtiels(
            text: secoundryText,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 11.sp,
                ),
          ),
          TextUtiels(
            paddingLeft: paddingForText ?? 40.w,
            text: primatyText,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 13.sp,
                ),
          ),
        ],
      ),
    );
  }
}
