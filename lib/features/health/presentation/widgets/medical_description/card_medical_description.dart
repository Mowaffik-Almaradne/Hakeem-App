import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/function/helper_function.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/health/domain/entities/res/prescription_get_all_entities.dart';
import 'package:hosptel_app/router/app_router.dart';

class CardMedicalDescription extends StatelessWidget {
  const CardMedicalDescription({super.key, required this.item});
  final PrescriptionItem item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteNamedScreens.midicalDesciptionTableNameRoute,
          arguments: item,
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 18.h),
        child: Container(
          width: 318.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: AppColorManger.fillColorCard,
            border: Border.all(
              color: AppColorManger.primaryColor,
              width: 1.5.w,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: SvgPicture.asset(
                  width: 10.w,
                  height: 22.h,
                  AppSvgManger.iconArrowProfile,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextUtiels(
                    paddingRight: 16.w,
                    text: AppWordManger.prescrition,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 14.sp,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Row(
                      children: [
                        TextUtiels(
                          text: formatTimeTo12Hour(item.creationTime),
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontSize: 11.sp,
                              ),
                        ),
                        TextUtiels(
                          paddingLeft: 10.w,
                          text: formatDate(item.creationTime),
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontSize: 11.sp,
                              ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
