import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/advertisement/domain/entities/res/advertisement_entities.dart';

class InfoAdvertisementWidget extends StatelessWidget {
  const InfoAdvertisementWidget({super.key, required this.item});
  final AdvertisementItem item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.centerRight,
      children: [
        Container(
          height: 170.h,
          width: 230.w,
          decoration: BoxDecoration(
            color: AppColorManger.fillColorCard,
            borderRadius: BorderRadius.circular(15),
            border: Border(
              bottom: BorderSide(
                color: AppColorManger.primaryColor,
                width: 1.7,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColorManger.shadowColor,
                blurRadius: 4,
                offset: const Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  width: 180.w,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: TextUtiels(
                      text: item.title,
                      fontFamily: AppFontFamily.tajawalBold,
                      color: AppColorManger.primaryColor,
                      fontSize: AppFontSizeManger.s16,
                      height: 3.h,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 90.h,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(right: 70.w, left: 20.w),
                  child: Text(
                    item.description,
                    style: TextStyle(
                      fontFamily: AppFontFamily.tajawalRegular,
                      color: AppColorManger.textColor1,
                      fontSize: AppFontSizeManger.s10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Icon
        Positioned(
          right: -12.w,
          top: 38.h,
          child: SvgPicture.asset(
            width: 80.w,
            height: 80.h,
            AppSvgManger.iconLight,
          ),
        ),
      ],
    );
  }
}
