import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/widget/main/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/router/app_router.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Navigator.pushReplacementNamed(
          context,
          RouteNamedScreens.homeScreenNameRoute,
        );
        context.read<ButtonNavCubit>().changeIndexButtonNav(2, context);
      },
      child: DefaultTabController(
        length: 2,
        child: MainBackGround(
          mainBody: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 59.h),
                //? Arrow And Text :
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RouteNamedScreens.homeScreenNameRoute,
                        );
                        context
                            .read<ButtonNavCubit>()
                            .changeIndexButtonNav(2, context);
                      },
                      child: SvgPicture.asset(
                        AppSvgManger.iconArrow,
                        width: 30.w,
                        height: 30.h,
                      ),
                    ),
                    TextUtiels(
                      paddingRight: 16.w,
                      text: 'حجوزاتي',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 20.sp,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  height: 55.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffF2F6FA),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TabBar(
                    automaticIndicatorColorAdjustment: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: const Color(0xff888888),
                    labelColor: AppColorManger.primaryColor,
                    indicatorColor: Colors.white,
                    indicatorWeight: 2,
                    indicator: BoxDecoration(
                      color: const Color(0xffE6F3FC),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    labelStyle:
                        Theme.of(context).textTheme.displayLarge?.copyWith(
                              fontSize: 16.sp,
                            ),
                    tabs: const [
                      Tab(
                        text: 'منتهي',
                      ),
                      Tab(
                        text: 'قيد الانتظار',
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtiels(
                          text: 'Test1',
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtiels(
                          text: 'Test1',
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
