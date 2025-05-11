// ignore_for_file: deprecated_member_use
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/main/main_app_bar/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/sanck_bar/snack_bar_back_to_exit.dart';
import 'package:hosptel_app/features/advertisement/presentation/cubit/advertisement_cubit.dart';
import 'package:hosptel_app/features/advertisement/presentation/widgets/lis_item_advertasment.dart';
import 'package:hosptel_app/features/doctor/presentation/widget/info_doctor_text.dart';
import 'package:hosptel_app/features/doctor/presentation/widget/info_doctor_widget.dart';
import 'package:hosptel_app/features/home/presentation/widgets/home_primary/caption_text_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/in_home/reservation_now_button_widget.dart';
import 'package:hosptel_app/features/services/presentation/cubit/services_cubit.dart';
import 'package:hosptel_app/features/services/presentation/widgets/srviecs_list_item.dart';
import 'package:hosptel_app/router/app_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final FirebaseMessaging _messaging;
  @override
  void initState() {
    super.initState();
    _initFirebaseMessaging();
  }

  void _initFirebaseMessaging() async {
    _messaging = FirebaseMessaging.instance;
    await _messaging.requestPermission(alert: true, badge: true, sound: true);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showDialogNotification(message);
    });

    // عند الضغط على الإشعار والتطبيق في الخلفية
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleMessageClick(message);
    });

  
    RemoteMessage? initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleMessageClick(initialMessage);
    }
  }

  void _showDialogNotification(RemoteMessage message) {
    if (!mounted) return;
    if (message.notification != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(message.notification?.title ?? ''),
          content: Text(message.notification?.body ?? ''),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(AppWordManger.done),
            ),
          ],
        ),
      );
    }
  }

  void _handleMessageClick(RemoteMessage message) {
    if (!mounted) return;

    // إعادة تعيين مكدس التنقل والانتقال إلى الصفحة الرئيسية
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteNamedScreens.homeScreenNameRoute,
      (route) => false,
    );

    // بعد التأكد من الانتقال إلى الصفحة الرئيسية، الانتقال إلى صفحة الإشعارات
    Future.delayed(const Duration(milliseconds: 100), () {
      Navigator.pushNamed(context, RouteNamedScreens.notificationNameRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime? lastPressedAt;
    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        if (lastPressedAt == null ||
            now.difference(lastPressedAt!) > const Duration(seconds: 2)) {
          lastPressedAt = now;
          SnackBarBackToExit.snackBar(context: context);
          return false; // Prevent exiting
        }
        return true; // Allow exiting
      },
      child: MainBackGround(
        mainBody: RefreshIndicator(
          onRefresh: () async {
            context.read<GetAllServicesCubit>().getAllServices(isRefresh: true);
            context
                .read<GetAllAdvertisementCubit>()
                .getAllAdvertisement(isRefresh: true);
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.only(top: 200.h, bottom: 50.h),
                child: Column(
                  children: [
                    //? button reservation Now :
                    const ReservationNowButtonWidget(
                      text: AppWordManger.reservationNow,
                    ),
                    //? about doctor label :
                    const CaptionTextWidget(
                      text: AppWordManger.aboutDoctor,
                    ),
                    //? about doctor
                    const InfoDoctorText(),
                    //? Services :
                    CaptionTextWidget(
                      padding:
                          EdgeInsets.only(left: 19.w, right: 19.w, top: 10.h),
                      text: AppWordManger.services,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: const InfoServicesListWidget(),
                    ),
                    //? Advertasment :
                    const CaptionTextWidget(
                      text: AppWordManger.tipsAndNews,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: const ListIteamAdvertisementWidget(),
                    ),
                  ],
                ),
              ),
              // تثبيت InfoDoctorWidget في أعلى الشاشة
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: InfoDoctorWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
