import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/services/domain/entities/res/get_all_services_entitie.dart';

class InfoServices extends StatelessWidget {
  const InfoServices({super.key, required this.services});
  final ItemListServices services;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //? Image :
        Container(
          padding: EdgeInsets.symmetric(vertical: 9.5.h, horizontal: 15.w),
          margin: EdgeInsets.only(bottom: 8.h),
          decoration: ShapeDecoration(
            shadows: [
              BoxShadow(
                blurRadius: 4,
                offset: const Offset(0, 4),
                color: AppColorManger.black.withOpacity(0.25),
              )
            ],
            color: AppColorManger.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 2,
                color: AppColorManger.primaryColor,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          child: Image.network(
            width: 32.w,
            height: 40.h,
            "http://${services.imageUrl}",
          ),
        ),
        //? Name :
        TextUtiels(
          maxLines: 2,
          fontFamily: AppFontFamily.tajawalLight,
          textAlign: TextAlign.center,
          text: services.name,
          color: AppColorManger.textServices,
          fontWeight: FontWeight.w700,
          fontSize: AppFontSizeManger.s13,
          height: 1.5.h,
        )
      ],
    );
  }
}
