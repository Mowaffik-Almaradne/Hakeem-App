import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/function/helper_function.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/reservation/domain/entities/req/create_appoinment_request.dart';

class CardSummaryWidget extends StatelessWidget {
  const CardSummaryWidget({super.key, required this.request});
  final CreateAppoinmentRequest request;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        bottom: 40.h,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColorManger.fillColorCard,
          border: Border.all(
            color: AppColorManger.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10).r,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //TODO FRON TOKE
              //? Card Summary :
              TextUtiels(
                paddingRight: 10.w,
                text: 'الاسم : لمى عبدالله الطويل',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 20.sp,
                      fontFamily: AppFontFamily.tajawalMedium,
                    ),
              ),
              Divider(
                color: AppColorManger.black.withOpacity(0.17),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextUtiels(
                    paddingRight: 5.w,
                    paddingTop: 12.h,
                    text: getTimePeriodForReservation(request.startTime),
                    color: AppColorManger.colorShowDailogButton,
                    fontSize: 16.sp,
                    fontFamily: AppFontFamily.tajawalMedium,
                  ),
                  TextUtiels(
                    paddingRight: 5.w,
                    paddingTop: 12.h,
                    text: formatDate(request.appointmentDate,
                        slasheFormate: true),
                    color: AppColorManger.colorShowDailogButton,
                    fontSize: 16.sp,
                    fontFamily: AppFontFamily.tajawalMedium,
                  ),
                  TextUtiels(
                    paddingRight: 10.w,
                    paddingTop: 10,
                    text: AppWordManger.bookingDate,
                    color: AppColorManger.colorShowDailogButton,
                    fontSize: 16.sp,
                    fontFamily: AppFontFamily.tajawalMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
