import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/health/domain/entities/res/prescription_details_entities.dart';

class MedicalDescriptionTableInfo extends StatelessWidget {
  const MedicalDescriptionTableInfo({super.key, required this.item});
  final PrescriptionDetailsItem item;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColorManger.secoundryColor,
          width: 1.2.w,
        ),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //? Medicine Name :
          TextUtiels(
            textOverflow: TextOverflow.ellipsis,
            paddingLeft: 13.w,
            text: item.medicineName,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 14.sp,
                ),
          ),

          SizedBox(
            width: 220.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //? Usage Times
                TextUtiels(
                  text: '${item.usageTimes} ابام',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 10.sp,
                      ),
                ),
                //? isBe fore Food :
                Visibility(
                  replacement: Container(
                    width: 25.w,
                    height: 5.h,
                    color: AppColorManger.secoundryColor,
                  ),
                  visible: item.isBeforeFood == true,
                  child: Checkbox(
                    value: true,
                    fillColor:
                        WidgetStatePropertyAll(AppColorManger.primaryColor),
                    checkColor: AppColorManger.white,
                    onChanged: null,
                  ),
                ), //?
                //? usage Duration :
                TextUtiels(
                  text: item.usageDuration.toString(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 10.sp,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
