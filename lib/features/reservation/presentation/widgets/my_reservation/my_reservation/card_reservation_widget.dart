import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/function/helper_function.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_my_reservation.dart';

class CardReservationWidget extends StatelessWidget {
  const CardReservationWidget({
    super.key,
    required this.iconCardReservatio,
    required this.showButtonCancleResvation,
    required this.showDivider,
    required this.height,
    this.onTapCancleReservation,
    required this.item,
    required this.index,
  });
  final String iconCardReservatio;
  final bool showButtonCancleResvation;
  final MyReservationItem item;
  final int index;
  final double height;
  final bool showDivider;
  final void Function()? onTapCancleReservation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.w,
        right: 15.w,
        // top: 33.h,
      ),
      child: Container(
        padding: EdgeInsets.only(top: 12.h, bottom: !showDivider ? 40.h : 12.h),
        decoration: BoxDecoration(
          color: AppColorManger.fillColorCard,
          border: Border.all(
            color: AppColorManger.primaryColor,
            width: 1.5.w,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            //? Number Reservation :
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //? Number Reservation From Api :
                TextUtiels(
                  paddingRight: 14.w,
                  text: index.toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColorManger.colorShowDailogButton,
                        fontSize: 16.sp,
                        fontWeight: AppFontWeightManger.fontWeightExtraBold,
                      ),
                ),
                TextUtiels(
                  text: AppWordManger.numberResevation,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColorManger.colorShowDailogButton,
                        fontSize: 16.sp,
                        fontWeight: AppFontWeightManger.fontWeightExtraBold,
                      ),
                ),
              ],
            ),
            Divider(
              color: AppColorManger.black.withOpacity(0.17),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(end: 10.w, top: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      //? Name Doctor From (Api)
                      TextUtiels(
                        text: item.dayName,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColorManger.colorShowDailogButton,
                              fontSize: 16.sp,
                              fontWeight:
                                  AppFontWeightManger.fontWeightExtraBold,
                            ),
                      ),
                      //? Text Date Resevation From Api :
                      TextUtiels(
                        paddingRight: 10.w,
                        text:
                            "${AppWordManger.dataReservation} : ${formatDate(item.appointmentDate, slasheFormate: true, isShowAmPm: true)}",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColorManger.colorShowDailogButton,
                              fontSize: 16.sp,
                              fontWeight:
                                  AppFontWeightManger.fontWeightExtraBold,
                            ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    width: 71.w,
                    height: 67.h,
                    iconCardReservatio,
                  ),
                ],
              ),
            ),
            //? Dividing :
            Visibility(
              visible: showDivider,
              child: Divider(
                color: AppColorManger.black.withOpacity(0.17),
              ),
            ),
            //? Button For Cancle Resevation :
            Visibility(
              visible: showButtonCancleResvation,
              child: GestureDetector(
                onTap: onTapCancleReservation,
                child: TextUtiels(
                  paddingTop: 5.h,
                  text: AppWordManger.cansleResevation,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 16.sp,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
