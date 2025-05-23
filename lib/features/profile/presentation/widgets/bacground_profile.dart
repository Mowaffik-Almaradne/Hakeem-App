import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/class/clipping_path_class.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class BackGroundProfile extends StatelessWidget {
  const BackGroundProfile({
    super.key,
    required this.textBackGround,
    this.visibleIcon,
    this.phoneNumber = '',
  });
  final String textBackGround;
  final bool? visibleIcon;
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: ClipPath(
        clipper: ClippingClass(),
        child: Container(
          width: double.infinity,
          height: 170.h,
          color: AppColorManger.backGroundClipper,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, phoneNumber);
                  },
                  child: Visibility(
                    visible: visibleIcon ?? true,
                    child: SvgPicture.asset(
                      AppSvgManger.iconArrow,
                      width: 30.w,
                      height: 30.h,
                    ),
                  ),
                ),
                TextUtiels(
                  paddingRight: 16.w,
                  text: textBackGround,
                  fontFamily: AppFontFamily.tajawalBold,
                  color: AppColorManger.white,
                  fontSize: AppFontSizeManger.s20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
