import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/function/helper_function.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/health/domain/entities/res/medical_session_entites.dart';
import 'package:hosptel_app/features/health/presentation/widgets/my_visits/item_row_vist.dart';

class InfoMyVisitItem extends StatelessWidget {
  const InfoMyVisitItem(
      {super.key, required this.item, required this.numberVists});
  final MedicalSessionItem item;
  final int numberVists;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      decoration: BoxDecoration(
        color: AppColorManger.fillColorCard,
        border: Border.all(
          color: AppColorManger.primaryColor,
          width: 1.5.w,
        ),
        borderRadius: BorderRadius.circular(5.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            width: 75.w,
            height: 75.h,
            AppSvgManger.iconMyVisit,
          ),

          //? Day :
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextUtiels(
                paddingBottome: 12.h,
                text: '$numberVists ${AppWordManger.visit}',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 20.sp,
                    ),
              ),
              //? day :
              RowItemVist(
                primatyText: AppWordManger.day,
                secoundryText:
                    formatDate(slasheFormate: true, item.creationTime),
              ),
              //? Hour :
              RowItemVist(
                  textDirection: TextDirection.rtl,
                  paddingForText: 25.w,
                  primatyText: AppWordManger.hour,
                  secoundryText: item.appointmentStartTime.isNotEmpty
                      ? getTimePeriod(
                          time: item.appointmentStartTime.substring(0, 5))
                      : ''),
            ],
          ),
          //? hour :
        ],
      ),
    );
  }
}
