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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //? Image :
        Container(
          decoration: ShapeDecoration(
            shadows: [
              BoxShadow(
                blurRadius: 4,
                offset: const Offset(0, 2),
                color: AppColorManger.black.withOpacity(0.12),
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Image.network(
              "http://${services.imageUrl}",
              width: 57.w,
              height: 57.h,
              fit: BoxFit.fill,
            ),
          ),
        ),
        //? Name :
        SizedBox(
          width: 100.w,
          height: 50.h,
          child: TextUtiels(
            maxLines: 2,
            fontFamily: AppFontFamily.tajawalLight,
            textAlign: TextAlign.center,
            text: services.name,
            color: AppColorManger.textServices,
            fontWeight: FontWeight.w700,
            fontSize: AppFontSizeManger.s13,
            height: 1.5.h,
          ),
        )
      ],
    );
  }
}
