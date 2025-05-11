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
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: AppColorManger.fillColorCard,
          border: Border.all(
            color: AppColorManger.primaryColor,
            width: 1.5.w,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              width: 10.w,
              height: 18.h,
              AppSvgManger.iconArrowProfile,
            ),
            Column(
              children: [
                TextUtiels(
                  paddingBottome: 4.h,
                  text: AppWordManger.prescrition,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 14.sp,
                      ),
                ),
                Row(
                  children: [
                    TextUtiels(
                      text: amAndPm(item.creationTime),
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: 11.sp,
                          ),
                    ),
                    TextUtiels(
                      text: formatTimeTo12Hour(item.creationTime),
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: 11.sp,
                          ),
                    ),
                    TextUtiels(
                      text: formatDate(item.creationTime),
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: 11.sp,
                          ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
