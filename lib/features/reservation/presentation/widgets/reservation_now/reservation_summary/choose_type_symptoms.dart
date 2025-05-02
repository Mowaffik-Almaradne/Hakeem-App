import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class ButtonDoneAndCancle extends StatelessWidget {
  const ButtonDoneAndCancle({
    super.key,
    this.onTapForDone,
  });
  final void Function()? onTapForDone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //? For Done :
          GestureDetector(
            onTap: onTapForDone,
            child: TextUtiels(
              paddingRight: 27.w,
              text: AppWordManger.done,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 11.sp,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
