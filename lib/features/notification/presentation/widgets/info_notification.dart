import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/function/helper_function.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/notification/domain/entities/get_all_notification_entities.dart';
import 'package:hosptel_app/features/notification/presentation/widgets/icon_notification_widget.dart';

class InfoNotificationWidget extends StatelessWidget {
  const InfoNotificationWidget({super.key, required this.item});
  final PatientNotification item;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 318.w,
      padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
      color: item.isReaded == false
          ? AppColorManger.colorButtonShowDailog
          : AppColorManger.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 200.w,
                child: TextUtiels(
                  textDirection: TextDirection.ltr,
                  text: item.body,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontSize: 14.sp),
                ),
              ),
              TextUtiels(
                text: formatDate(item.creationTime),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 12.sp,
                      color: AppColorManger.gray,
                    ),
              ),
            ],
          ),
          //? Icon Notification :
          const IconNotificationWidget(),
        ],
      ),
    );
  }
}
