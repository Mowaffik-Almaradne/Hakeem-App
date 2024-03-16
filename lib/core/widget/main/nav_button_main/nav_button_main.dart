import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/router/app_router.dart';

class MainButtonNavigation extends StatefulWidget {
  const MainButtonNavigation({super.key});

  @override
  State<MainButtonNavigation> createState() => _MainButtonNavigationState();
}

int changeColorIcon = 2;

class _MainButtonNavigationState extends State<MainButtonNavigation> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: changeColorIcon,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: AppColorManger.primaryColor,
      color: AppColorManger.grayNavButton,
      iconPadding: 17.w,
      height: 75.h,
      items: [
        CurvedNavigationBarItem(
          child: SvgPicture.asset(
            AppSvgManger.iconHeart,
            width: 25.w,
            height: 25.h,
            colorFilter: ColorFilter.mode(
              changeColorIconFun(0),
              BlendMode.srcIn,
            ),
          ),
          label: removeLabelIconFun(0, AppWordManger.health),
          labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColorManger.primaryColor,
              ),
        ),
        CurvedNavigationBarItem(
          child: SvgPicture.asset(
            AppSvgManger.iconNotification,
            width: 25.w,
            height: 25.h,
            colorFilter: ColorFilter.mode(
              changeColorIconFun(1),
              BlendMode.srcIn,
            ),
          ),
          label: removeLabelIconFun(1, AppWordManger.notification),
          labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColorManger.primaryColor,
              ),
        ),
        CurvedNavigationBarItem(
          child: SvgPicture.asset(
            AppSvgManger.iconHome,
            width: 25.w,
            height: 25.h,
            colorFilter: ColorFilter.mode(
              changeColorIconFun(2),
              BlendMode.srcIn,
            ),
          ),
          label: removeLabelIconFun(2, AppWordManger.home),
          labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColorManger.primaryColor,
              ),
        ),
        CurvedNavigationBarItem(
          child: SvgPicture.asset(
            AppSvgManger.iconReserviation,
            width: 25.w,
            height: 25.h,
          ),
          label: removeLabelIconFun(3, AppWordManger.reservition),
          labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColorManger.primaryColor,
              ),
        ),
        CurvedNavigationBarItem(
          child: SvgPicture.asset(
            AppSvgManger.iconProfile,
            width: 25.w,
            height: 25.h,
            colorFilter: ColorFilter.mode(
              changeColorIconFun(4),
              BlendMode.srcIn,
            ),
          ),
          label: removeLabelIconFun(4, AppWordManger.profile),
          labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColorManger.primaryColor,
              ),
        ),
      ],
      onTap: (index) {
        setState(() {
          changeColorIcon = index;
        });
        routingNamePage(changeColorIcon, context);
      },
    );
  }
}

//? function for change color as soon as active :
Color changeColorIconFun(int index) {
  return changeColorIcon == index
      ? AppColorManger.white
      : AppColorManger.primaryColor;
}

//? function for remove label text as soon as active :
String removeLabelIconFun(int index, String labelWord) {
  return changeColorIcon == index ? '' : labelWord;
}

//? function for Routing Page :

void routingNamePage(int index, BuildContext context) {
  switch (index) {
    case 0:
      Navigator.pushReplacementNamed(
          context, RouteNamedScreens.healthNameRoute);
      break;
    case 1:
      Navigator.pushReplacementNamed(
          context, RouteNamedScreens.notificationNameRoute);
      break;
    case 2:
      Navigator.pushReplacementNamed(
          context, RouteNamedScreens.homeScreenNameRoute);
      break;
    case 3:
      Navigator.pushReplacementNamed(
          context, RouteNamedScreens.reservationNameRoute);
      break;
    case 4:
      Navigator.pushReplacementNamed(
          context, RouteNamedScreens.profileNameRoute);
      break;
  }
}
