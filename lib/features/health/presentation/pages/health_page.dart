import 'package:flutter/material.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/main/main_app_bar/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/repeted/titel_pages_widget.dart';
import 'package:hosptel_app/features/health/presentation/widgets/card_feature_health.dart';
import 'package:hosptel_app/router/app_router.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: Column(
        children: [
          //? Title Reservation :
          const TitlePageWidget(
            titleText: AppWordManger.myhealth,
          ),
          //? My Fisited :
          CardFeatureHealth(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNamedScreens.myVisitNameRoute,
              );
            },
            cardText: AppWordManger.myVisited,
          ),
          //? My Files
          CardFeatureHealth(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNamedScreens.myFileNameRoute,
              );
            },
            cardText: AppWordManger.myFiles,
          ),
          //? Medical Descraption:
          CardFeatureHealth(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNamedScreens.midicalDesciptionNameRoute,
              );
            },
            cardText: AppWordManger.medicalDescraption,
          ),
          //? Finisial Account:
          CardFeatureHealth(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNamedScreens.monyAccountNameRoute,
              );
            },
            cardText: AppWordManger.finisialAccount,
          ),
        ],
      ),
    );
  }
}
