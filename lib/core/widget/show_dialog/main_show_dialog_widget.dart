import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/show_dialog/button_show_deailog.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class MainShowDialog {
  static void customShowDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: AppColorManger.white,
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0).r,
          ), //
          title: SvgPicture.asset(
            alignment: Alignment.centerLeft,
            AppSvgManger.iconArrow,
            width: 30.w,
            height: 30.h,
          ),
          content: SizedBox(
            width: 313.w,
            height: 170.h,
            child: Column(
              children: [
                TextUtiels(
                  paddingTop: 20.h,
                  paddingBottome: 30.h,
                  text: AppWordManger.areYoueSureDeletedAccount,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16.sp,
                        color: AppColorManger.backGroundColorShowDialog,
                      ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //? Yes :
                    ButtonShowDeailog(
                      buttonColor: AppColorManger.fillColorCard,
                      textButton: AppWordManger.yes,
                      textColor: AppColorManger.colorShowDailogButton,
                    ),
                    //? Cansle :
                    SizedBox(width: 23.w),
                    ButtonShowDeailog(
                      buttonColor: AppColorManger.colorButtonShowDailog,
                      textButton: AppWordManger.no,
                      textColor: AppColorManger.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
