import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/class/clipping_path_class.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/main/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/card_main_profile.dart';
import 'package:hosptel_app/router/app_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: ClippingClass(),
              //? Back Ground Profile Page :
              child: Container(
                width: double.infinity,
                height: 170.h,
                color: AppColorManger.backGroundClipper,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        AppSvgManger.iconArrow,
                        width: 30.w,
                        height: 30.h,
                      ),
                      TextUtiels(
                        text: AppWordManger.profile,
                        fontFamily: AppFontFamily.tajawalBold,
                        color: AppColorManger.white,
                        fontSize: AppFontSizeManger.s20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.h),
            //? Info Account :
            CardMainProfile(
              text: AppWordManger.infoAccount,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNamedScreens.infoProfileNameRoute,
                );
              },
            ),
            //? Change Password :
            CardMainProfile(
              text: AppWordManger.changePassword,
              onTap: () {},
            ),
            //? Updata Number :
            CardMainProfile(
              text: AppWordManger.updateMyNumber,
              onTap: () {},
            ),
            //? Delete My Account :
            CardMainProfile(
              text: AppWordManger.deleteAccount,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
