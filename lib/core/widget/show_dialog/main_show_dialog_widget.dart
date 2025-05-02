import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/widget/show_dialog/button_show_deailog.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class MainShowDialog {
  static void customShowDialog(
    BuildContext context, {
    void Function()? onTapFirst,
    void Function()? onTapSecound,
    required String firstButtonText,
    required String secoundButtonText,
    required String textPopUp,
    double? hieght,
    EdgeInsets? insetPadding,
    bool? barrierDismissible,
  }) {
    showDialog(
      barrierDismissible: barrierDismissible ?? true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: insetPadding ??
              EdgeInsets.symmetric(
                vertical: 230.h,
              ),
          elevation: 0,
          backgroundColor: AppColorManger.white,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0).r,
          ), //
          title: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              alignment: Alignment.centerLeft,
              AppSvgManger.iconArrow,
              width: 30.w,
              height: 30.h,
            ),
          ),
          content: Column(
            children: [
              TextUtiels(
                paddingLeft: 3.w,
                paddingRight: 3.w,
                paddingTop: 20.h,
                paddingBottome: 30.h,
                text: textPopUp,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 16.sp,
                      color: AppColorManger.backGroundColorShowDialog,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //? Yes :
                  ButtonShowDeailog(
                    onTap: onTapFirst,
                    buttonColor: AppColorManger.fillColorCard,
                    textButton: firstButtonText,
                    textColor: AppColorManger.colorShowDailogButton,
                  ),
                  //? Cansle :

                  ButtonShowDeailog(
                    onTap: onTapSecound,
                    buttonColor: AppColorManger.colorButtonShowDailog,
                    textButton: secoundButtonText,
                    textColor: AppColorManger.primaryColor,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
