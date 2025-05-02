import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/loading/loading_for_list.dart';
import 'package:hosptel_app/core/widget/main/main_app_bar/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/repeted/titel_pages_widget.dart';
import 'package:hosptel_app/core/widget/pagination/list_view_pagination.dart';
import 'package:hosptel_app/features/health/domain/entities/res/medical_session_entites.dart';
import 'package:hosptel_app/features/health/presentation/cubit/get_all_medical_session_cubit/get_all_medical_session_cubit.dart';
import 'package:hosptel_app/features/health/presentation/widgets/my_visits/info_my_visit.dart';
import 'package:hosptel_app/features/health/presentation/widgets/my_visits/not_found_my_visit.dart';

class MyVistsPage extends StatelessWidget {
  const MyVistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: RefreshIndicator(
        onRefresh: () async {
          context
              .read<GetAllMedicalSessionCubit>()
              .getAllMedicalSession(isRefresh: true);
        },
        child: Column(
          children: [
            TitlePageWidget(
              titleText: AppWordManger.myVisited,
              onTap: () => Navigator.pop(context),
            ),
            BlocBuilder<GetAllMedicalSessionCubit, GetAllMedicalSessionState>(
              builder: (context, state) {
                if (state.status == DeafultBlocStatus.loading &&
                    state.itemsList.isEmpty) {
                  return const LoadingListViewHorisontal();
                }
                return Visibility(
                  replacement: const NotFoundMyVisit(),
                  visible: state.itemsList.isNotEmpty,
                  child: Expanded(
                    child: ListViewWithPagenationWidget<MedicalSessionItem>(
                      padding: EdgeInsets.only(
                          left: 19.w, right: 19.w, bottom: 50.h),
                      separator: SizedBox(height: 25.h),
                      haseReachedMax: state.haseReachedMax,
                      item: state.itemsList,
                      loading: state.status == DeafultBlocStatus.loading,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      childListView: (myVisit, i) => InfoMyVisitItem(
                        numberVists: i + 1,
                        item: myVisit,
                      ),
                      onNotification: (paginationEntite) => context
                          .read<GetAllMedicalSessionCubit>()
                          .getAllMedicalSession(
                              paginationEntite: paginationEntite),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
