import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/class/clipping_path_class.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/widget/main/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/features/home/presentation/widgets/home_secoundry/card_luncher.dart';

class HomeSecoundryPage extends StatelessWidget {
  const HomeSecoundryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: Stack(
        alignment: Alignment.centerRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: ClippingClass(),
                child: Container(
                  width: double.infinity,
                  height: 140.h,
                  decoration: BoxDecoration(
                    color: AppColorManger.primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 22.w,
                  vertical: 25.h,
                ),
                child: const Column(
                  children: [
                    CardLuncherWidget(
                      icon: AppSvgManger.iconPhone,
                      text: '0935059787',
                    ),
                    CardLuncherWidget(
                      icon: AppSvgManger.iconLocation,
                      text: 'دمشق _المزة',
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 50.h,
            child: Container(
              decoration: BoxDecoration(
                color: AppColorManger.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColorManger.white,
                  width: 3,
                ),
              ),
              width: 200.w,
              height: 200.h,
            ),
          ),
        ],
      ),
    );
  }
}


/*
  
*/