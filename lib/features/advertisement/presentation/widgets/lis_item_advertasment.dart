import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/empty_data/empty_text_widget.dart';
import 'package:hosptel_app/core/widget/loading/loading_for_list.dart';
import 'package:hosptel_app/features/advertisement/presentation/cubit/advertisement_cubit.dart';
import 'package:hosptel_app/features/advertisement/presentation/widgets/info_advertasment.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListIteamAdvertisementWidget extends StatefulWidget {
  const ListIteamAdvertisementWidget({Key? key}) : super(key: key);

  @override
  InfoTipasNewsWidgetState createState() => InfoTipasNewsWidgetState();
}

class InfoTipasNewsWidgetState extends State<ListIteamAdvertisementWidget> {
  late CarouselController _pageController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = CarouselController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllAdvertisementCubit, GetAllAdvertisementState>(
      builder: (context, state) {
        if (state.status == DeafultBlocStatus.loading) {
          return const LoadingForList();
        }
        if (state.itemsList.isEmpty) {
          return const EmptyTextWidget(
            text: AppWordManger.noAdvAvailableAtThisTime,
          );
        }
        return Column(
          children: [
            CarouselSlider.builder(
              //? Option :
              options: CarouselOptions(
                height: 170.h,
                enlargeCenterPage: true,
                autoPlay: state.itemsList.length > 1 ? true : false,
                autoPlayInterval: const Duration(seconds: 3),
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),

              carouselController: _pageController,
              itemCount: state.itemsList.length,
              itemBuilder: (context, index, realIndex) {
                return InfoAdvertisementWidget(
                  item: state.itemsList[index],
                );
              },
            ),

            //? Scroll Smooth :
            Visibility(
              visible: state.itemsList.length > 1,
              child: Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: AnimatedSmoothIndicator(
                  activeIndex: currentIndex,
                  count: state.itemsList.length,
                  effect: JumpingDotEffect(
                    spacing: 8,
                    dotWidth: 30.w,
                    dotHeight: 5.h,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 1.5,
                    activeDotColor: AppColorManger.primaryColor,
                  ),
                  onDotClicked: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
