import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/png_manger.dart';
import 'package:hosptel_app/core/widget/main/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/repeted/titel_pages_widget.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class MonyAccountPage extends StatelessWidget {
  const MonyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: SingleChildScrollView(
        child: Column(
          children: [
            TitlePageWidget(
              titleText: 'الحساب المالي',
              onTap: () => Navigator.pop(context),
              paddingBottome: 15.h,
            ),
            //? Image Account :
            Image.asset(
              width: 100.w,
              height: 100.h,
              AppPngManger.imageProfile,
            ),
            //? NAME :
            TextUtiels(
              text: 'لمى الطويل',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 20.sp,
                    color: AppColorManger.textColor2,
                  ),
            ),
            //? Number Phone
            TextUtiels(
              text: '0935059855',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 20.sp,
                    color: const Color(0xffADADAD),
                  ),
            ),
            //? Carad Pymant :
            Container(
              margin: EdgeInsets.only(top: 14.h),
              width: 318.w,
              height: 78.h,
              decoration: BoxDecoration(
                color: AppColorManger.fillColorCard,
                border: Border.all(
                  color: AppColorManger.primaryColor,
                  width: 1.2.w,
                ),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextUtiels(
                    paddingLeft: 15.w,
                    text: 'تم الدفع ',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: 16.sp,
                          color: const Color(0xffADADAD),
                        ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      children: [
                        TextUtiels(
                          text: 'ل.س',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontFamily: AppFontFamily.extraBold,
                                    fontSize: 20.sp,
                                  ),
                        ),
                        TextUtiels(
                          text: '50,000',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontFamily: AppFontFamily.extraBold,
                                    fontSize: 20.sp,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //? Detailes :
            Align(
              alignment: Alignment.centerRight,
              child: TextUtiels(
                paddingRight: 21.w,
                paddingTop: 28.5.h,
                text: 'التفاصيل',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 20.sp,
                      color: AppColorManger.textColor2,
                    ),
              ),
            ),
            //? Card Detailse :
            Container(
              width: 320.w,
              height: 180.h,
              decoration: BoxDecoration(
                  color: AppColorManger.fillColorCard,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff646464).withOpacity(0.25),
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5.r)),
              child: Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 20),
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            children: [
                              TextUtiels(
                                text: 'ل.س',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      fontFamily: AppFontFamily.extraBold,
                                      fontSize: 20.sp,
                                    ),
                              ),
                              TextUtiels(
                                text: '50,000',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      fontFamily: AppFontFamily.extraBold,
                                      fontSize: 20.sp,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextUtiels(
                              text: 'لمى الطويل',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    fontSize: 15.sp,
                                    color: const Color(0xff5C5C5C),
                                  ),
                            ),
                            TextUtiels(
                              text: '2:15 2023/8/25',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColorManger.colorShowDailogButton,
                                  ),
                            ),
                          ],
                        ),
                        //? Icon :
                        Container(
                          width: 26.w,
                          height: 30.w,
                          decoration: BoxDecoration(
                            color: AppColorManger.secoundryColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                  itemCount: 3,
                ),
              ),
            ),
            //? Cost Full :
            Container(
              margin: EdgeInsets.only(top: 22.h, bottom: 40.h),
              width: 318.w,
              height: 61.h,
              decoration: BoxDecoration(
                color: AppColorManger.fillColorCard,
                border: Border.all(
                  color: AppColorManger.primaryColor,
                  width: 1.2.w,
                ),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      children: [
                        TextUtiels(
                          text: 'ل.س',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontFamily: AppFontFamily.extraBold,
                                    fontSize: 20.sp,
                                  ),
                        ),
                        TextUtiels(
                          text: '50,000',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontFamily: AppFontFamily.extraBold,
                                    fontSize: 20.sp,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  TextUtiels(
                    paddingRight: 15.w,
                    text: 'الكلفة الكلية',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xff4D4D4D),
                          fontSize: 16.sp,
                          fontFamily: AppFontFamily.extraBold,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
