import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/function/helper_function.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/sanck_bar/main_snack_bar.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/health/domain/entities/res/patient_attachmnet_entities.dart';

class InfoMyFileWidget extends StatefulWidget {
  const InfoMyFileWidget({super.key, required this.item});
  final PatientAttachmnetItem item;
  @override
  State<InfoMyFileWidget> createState() => _InfoMyFileWidgetState();
}

//TODO REFO LOADING  IN Finsh
class _InfoMyFileWidgetState extends State<InfoMyFileWidget> {
  bool isDownloading = false;
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
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Download Icon
          GestureDetector(
            onTap: () {
              if (!isDownloading) {
                setState(() {
                  isDownloading = true;
                });
                downloadFile(url: widget.item.fileUrl, context: context);
              }
            },
            child: isDownloading
                ? const MainLoadignWidget()
                : SvgPicture.asset(
                    width: 32.w,
                    height: 32.h,
                    AppSvgManger.iconDowanload,
                  ),
          ),
          // Info File
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100.w,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: TextUtiels(
                    text: widget.item.fileName,
                    paddingBottome: 3.h,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontSize: 16.sp,
                        ),
                  ),
                ),
              ),
              Row(
                children: [
                  TextUtiels(
                    paddingRight: 5.w,
                    text: formatTimeTo12Hour(widget.item.creationTime),
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: 10.sp,
                        ),
                  ),
                  TextUtiels(
                    paddingRight: 5.w,
                    text: formatDate(widget.item.creationTime,
                        slasheFormate: true),
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: 12.sp,
                        ),
                  ),
                  TextUtiels(
                    text: '${widget.item.fileSize}kB',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: 12.sp,
                        ),
                  ),
                ],
              )
            ],
          ),
          // Icon File Or Image
          Visibility(
            visible: isImageFile(widget.item.fileUrl),
            replacement: SvgPicture.asset(
              width: 70.w,
              height: 70.h,
              AppSvgManger.iconFile,
            ),
            child: SvgPicture.asset(
              width: 70.w,
              height: 70.h,
              AppSvgManger.iconImageForDowanload,
            ),
          ),
        ],
      ),
    );
  }

//? For Doanload File :
  void downloadFile({
    required String url,
    required BuildContext context,
  }) async {
    try {
      await FileDownloader.downloadFile(
        notificationType: NotificationType.all,
        url: url,
        onProgress: (fileName, progress) {},
        onDownloadCompleted: (path) {
          setState(() {
            isDownloading = false;
          });

          SnackBarUtil.showSnackBar(
              message: 'تم تحميل بنجاح', context: context);
        },
        onDownloadError: (errorMessage) {
          setState(() {
            isDownloading = false;
          });

          SnackBarUtil.showSnackBar(message: errorMessage, context: context);
        },
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
