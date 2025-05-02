import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/loading/loading_for_list.dart';
import 'package:hosptel_app/core/widget/main/main_app_bar/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/repeted/titel_pages_widget.dart';
import 'package:hosptel_app/core/widget/pagination/list_view_pagination.dart';
import 'package:hosptel_app/features/health/domain/entities/res/patient_attachmnet_entities.dart';
import 'package:hosptel_app/features/health/presentation/cubit/get_all_patient_attachmnet_cubit/get_all_patient_attachmnet_cubit.dart';
import 'package:hosptel_app/features/health/presentation/widgets/my_files/empty_my_file.dart';
import 'package:hosptel_app/features/health/presentation/widgets/my_files/info_my_file.dart';

class MyFilePage extends StatelessWidget {
  const MyFilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: RefreshIndicator(
        onRefresh: () async {
          context
              .read<GetAllPatientAttachmnetCubit>()
              .getAllPatientAttachmnet(isRefresh: true);
        },
        child: Column(
          children: [
            TitlePageWidget(
              titleText: AppWordManger.myFiles,
              onTap: () => Navigator.pop(context),
            ),
            //? Info List My File :

            BlocBuilder<GetAllPatientAttachmnetCubit,
                GetAllPatientAttachmnetState>(
              builder: (context, state) {
                if (state.status == DeafultBlocStatus.loading &&
                    state.itemsList.isEmpty) {
                  return const LoadingListViewHorisontal();
                }
                return Visibility(
                  replacement: const EmptyMyFileWidget(),
                  visible: state.itemsList.isNotEmpty,
                  child: Expanded(
                    child: ListViewWithPagenationWidget<PatientAttachmnetItem>(
                      padding: EdgeInsets.only(
                          left: 19.w, right: 19.w, bottom: 50.h),
                      separator: SizedBox(height: 25.h),
                      haseReachedMax: state.haseReachedMax,
                      item: state.itemsList,
                      loading: state.status == DeafultBlocStatus.loading,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      childListView: (myFile, i) => InfoMyFileWidget(
                        item: myFile,
                      ),
                      onNotification: (paginationEntite) => context
                          .read<GetAllPatientAttachmnetCubit>()
                          .getAllPatientAttachmnet(
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
