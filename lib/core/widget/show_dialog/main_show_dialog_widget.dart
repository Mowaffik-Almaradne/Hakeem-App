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
    bool isRow = true,
    EdgeInsets? insetPadding,
    bool? barrierDismissible,
  }) {
    showDialog(
      barrierDismissible: barrierDismissible ?? true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
              width: 25.w,
              height: 25.h,
            ),
          ),
          actions: [
            Column(
              children: [
                TextUtiels(
                  paddingLeft: 3.w,
                  paddingRight: 3.w,
                  paddingBottome: 22.5.h,
                  text: textPopUp,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16.sp,
                        color: AppColorManger.backGroundColorShowDialog,
                      ),
                ),
                Visibility(
                  visible: isRow,
                  replacement: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //? Yes :
                      Padding(
                        padding: EdgeInsets.only(bottom: 7.h),
                        child: ButtonShowDeailog(
                          onTap: onTapFirst,
                          buttonColor: AppColorManger.fillColorCard,
                          textButton: firstButtonText,
                          textColor: AppColorManger.colorShowDailogButton,
                        ),
                      ),
                      //? Cansle :
                      ButtonShowDeailog(
                        onTap: onTapSecound,
                        buttonColor: AppColorManger.colorButtonShowDailog,
                        textButton: "$secoundButtonText ",
                        textColor: AppColorManger.primaryColor,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        textButton: "$secoundButtonText ",
                        textColor: AppColorManger.primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
