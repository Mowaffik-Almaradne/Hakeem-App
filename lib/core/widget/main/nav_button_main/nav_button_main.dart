// ignore_for_file: deprecated_member_use
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/helper/function_nave.dart';

class MainButtonNavigation extends StatefulWidget {
  const MainButtonNavigation({super.key});

  @override
  State<MainButtonNavigation> createState() => _MainButtonNavigationState();
}

int selectedIndex = 2;

class _MainButtonNavigationState extends State<MainButtonNavigation> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectedIndex != 2) {
          setState(() {
            selectedIndex = 2;
          });
          routingNamePage(selectedIndex, context);
          return false;
        }
        return true;
      },
      child: CurvedNavigationBar(
        index: selectedIndex,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: AppColorManger.primaryColor,
        color: AppColorManger.grayNavButton,
        iconPadding: 17.w,
        height: 70.h,
        items: [
          CurvedNavigationBarItem(
            //? health Tap :
            child: Padding(
              padding: paddingWordUnSelected(index: 0),
              child: SvgPicture.asset(
                AppSvgManger.iconHeart,
                width: 25.w,
                height: 25.h,
                colorFilter: ColorFilter.mode(
                  changeColorIconFun(0),
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: removeLabelIconFun(0, AppWordManger.health),
            labelStyle: TextStyle(
              fontFamily: AppFontFamily.tajawalRegular,
              color: AppColorManger.primaryColor,
              fontSize: AppFontSizeManger.s9,
            ),
          ), //?
          //? notification Tap :
          CurvedNavigationBarItem(
            child: Padding(
              padding: paddingWordUnSelected(index: 1),
              child: SvgPicture.asset(
                AppSvgManger.iconNotification,
                width: 25.w,
                height: 25.h,
                colorFilter: ColorFilter.mode(
                  changeColorIconFun(1),
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: removeLabelIconFun(1, AppWordManger.notification),
            labelStyle: TextStyle(
              fontFamily: AppFontFamily.tajawalRegular,
              color: AppColorManger.primaryColor,
              fontSize: AppFontSizeManger.s9,
            ),
          ), //?
          //? Home Tap
          CurvedNavigationBarItem(
            child: Padding(
              padding: paddingWordUnSelected(index: 2),
              child: SvgPicture.asset(
                AppSvgManger.iconHome,
                width: 25.w,
                height: 25.h,
                colorFilter: ColorFilter.mode(
                  changeColorIconFun(2),
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: removeLabelIconFun(2, AppWordManger.home),
            labelStyle: TextStyle(
              fontFamily: AppFontFamily.tajawalRegular,
              color: AppColorManger.primaryColor,
              fontSize: AppFontSizeManger.s9,
            ),
          ), //?
          //? Reservation Tap :
          CurvedNavigationBarItem(
            child: Padding(
              padding: paddingWordUnSelected(index: 3),
              child: SvgPicture.asset(
                AppSvgManger.iconReserviation,
                width: 25.w,
                height: 25.h,
              ),
            ),
            label: removeLabelIconFun(3, AppWordManger.reservition),
            labelStyle: TextStyle(
              fontFamily: AppFontFamily.tajawalRegular,
              color: AppColorManger.primaryColor,
              fontSize: AppFontSizeManger.s9,
            ),
          ), //?

          //? profile Tap :
          CurvedNavigationBarItem(
            child: Padding(
              padding: paddingWordUnSelected(index: 4),
              child: SvgPicture.asset(
                AppSvgManger.iconProfile,
                width: 25.w,
                height: 25.h,
                colorFilter: ColorFilter.mode(
                  changeColorIconFun(4),
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: removeLabelIconFun(4, AppWordManger.profile),
            labelStyle: TextStyle(
              fontFamily: AppFontFamily.tajawalRegular,
              color: AppColorManger.primaryColor,
              fontSize: AppFontSizeManger.s9,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            if (index != selectedIndex) {
              selectedIndex = index;
              routingNamePage(selectedIndex, context);
            }
          });
        },
      ),
    );
  }
}
