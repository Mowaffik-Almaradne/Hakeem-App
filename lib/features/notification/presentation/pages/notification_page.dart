import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/loading/loading_for_list.dart';
import 'package:hosptel_app/core/widget/main/main_app_bar/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/repeted/titel_pages_widget.dart';
import 'package:hosptel_app/core/widget/pagination/list_view_pagination.dart';
import 'package:hosptel_app/features/notification/domain/entities/get_all_notification_entities.dart';
import 'package:hosptel_app/features/notification/presentation/cubit/get_all_patiient_notification_cubit/get_all_patient_notification_cubit.dart';
import 'package:hosptel_app/features/notification/presentation/cubit/set_notifications_as_readed_cubit/set_notifications_as_readed_cubit.dart';
import 'package:hosptel_app/features/notification/presentation/widgets/emty_info_notification.dart';
import 'package:hosptel_app/features/notification/presentation/widgets/info_notification.dart';
import 'package:hosptel_app/router/app_router.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

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
      child: MainBackGround(
        mainBody: RefreshIndicator(
          onRefresh: () async {
            context
                .read<GetAllPatientNotificationCubit>()
                .getAllPatientNotification(isRefresh: true);
          },
          child: Column(
            children: [
              //? Title Page Notifacation :
              const TitlePageWidget(
                titleText: AppWordManger.notifications,
              ),
              //? List From Api Notifications :
              BlocConsumer<GetAllPatientNotificationCubit,
                  GetAllPatientNotificationState>(
                listener: (context, state) {
                  if (state.status == DeafultBlocStatus.done) {
                    context
                        .read<SetNotificationsAsReadedCubit>()
                        .setNotificationsAsReaded(
                            asReadedNotification: state.itemsIsReaded);
                  }
                },
                builder: (context, state) {
                  if (state.status == DeafultBlocStatus.loading &&
                      state.itemsList.isEmpty) {
                    return const LoadingListViewHorisontal();
                  }
                  return Visibility(
                    visible: state.itemsList.isNotEmpty,
                    replacement: const EmptyInfoNotification(),
                    child: Expanded(
                      child: ListViewWithPagenationWidget<PatientNotification>(
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, bottom: 40.h),
                        separator: SizedBox(height: 40.h),
                        haseReachedMax: state.haseReachedMax,
                        item: state.itemsList,
                        loading: state.status == DeafultBlocStatus.loading,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        childListView: (item, i) => InfoNotificationWidget(
                          item: item,
                        ),
                        onNotification: (paginationEntite) => context
                            .read<GetAllPatientNotificationCubit>()
                            .getAllPatientNotification(
                                paginationEntite: paginationEntite),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
