import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/main/main_app_bar/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/repeted/titel_pages_widget.dart';
import 'package:hosptel_app/features/general_setting/presentation/cubit/general_setting_cubit.dart';
import 'package:hosptel_app/features/health/presentation/widgets/card_feature_health.dart';
import 'package:hosptel_app/router/app_router.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: BlocBuilder<GeneralSettingCubit, GeneralSettingState>(
        builder: (context, state) {
          return Column(
            children: [
              //? Title Reservation :
              const TitlePageWidget(
                isGeneralSeetings: false,
                titleText: AppWordManger.myhealth,
              ),
              //? My Fisited :
              Visibility(
                visible: state.entity.result.isDisplaySessions,
                child: CardFeatureHealth(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNamedScreens.myVisitNameRoute,
                    );
                  },
                  cardText: AppWordManger.myVisited,
                ),
              ),
              //? My Files
              Visibility(
                visible: state.entity.result.isDisplayAttachments,
                child: CardFeatureHealth(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNamedScreens.myFileNameRoute,
                    );
                  },
                  cardText: AppWordManger.myFiles,
                ),
              ),
              //? Medical Descraption:
              Visibility(
                visible: state.entity.result.isDisplayPrescription,
                child: CardFeatureHealth(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNamedScreens.midicalDesciptionNameRoute,
                    );
                  },
                  cardText: AppWordManger.medicalDescraption,
                ),
              ),
              //? Finisial Account:
              Visibility(
                visible: state.entity.result.isDisplayAccounts,
                child: CardFeatureHealth(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNamedScreens.monyAccountNameRoute,
                    );
                  },
                  cardText: AppWordManger.finisialAccount,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
