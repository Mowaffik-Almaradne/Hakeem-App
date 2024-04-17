import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InfoTipasNewsWidget extends StatefulWidget {
  const InfoTipasNewsWidget({Key? key}) : super(key: key);

  @override
  InfoTipasNewsWidgetState createState() => InfoTipasNewsWidgetState();
}

class InfoTipasNewsWidgetState extends State<InfoTipasNewsWidget> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 170.h,
          child: ListView.separated(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 0.w),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      width: 225.w,
                      height: 170.h,
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
                          TextUtiels(
                            text: 'بعد حقن الفيلر',
                            fontFamily: AppFontFamily.tajawalBold,
                            color: AppColorManger.primaryColor,
                            fontSize: AppFontSizeManger.s16,
                            height: 3.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextUtiels(
                                paddingLeft: 25.w,
                                text: AppWordManger.textVisibale,
                                fontFamily: AppFontFamily.tajawalRegular,
                                color: AppColorManger.textColor1,
                                fontSize: AppFontSizeManger.s10,
                                height: 1.2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: -10.w,
                      child: SvgPicture.asset(
                        width: 88.w,
                        height: 88.h,
                        AppSvgManger.iconLight,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 30.h),
        SmoothPageIndicator(
          controller: _pageController,
          count: 4,
          onDotClicked: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          effect: JumpingDotEffect(
            spacing: 8,
            dotWidth: 45.w,
            dotHeight: 3.h,
            paintStyle: PaintingStyle.stroke,
            strokeWidth: 1.5,
            activeDotColor: AppColorManger.primaryColor,
          ),
        ),
      ],
    );
  }
}
