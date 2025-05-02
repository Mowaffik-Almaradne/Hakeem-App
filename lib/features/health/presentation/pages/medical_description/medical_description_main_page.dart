import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/loading/loading_for_list.dart';
import 'package:hosptel_app/core/widget/main/main_app_bar/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/repeted/titel_pages_widget.dart';
import 'package:hosptel_app/core/widget/pagination/list_view_pagination.dart';
import 'package:hosptel_app/features/health/domain/entities/res/prescription_get_all_entities.dart';
import 'package:hosptel_app/features/health/presentation/cubit/get_all_prescription_cubit.dart/get_all_prescription_cubit.dart';
import 'package:hosptel_app/features/health/presentation/widgets/medical_description/card_medical_description.dart';
import 'package:hosptel_app/features/health/presentation/widgets/medical_description/empty_medical_description.dart';

class MidicalDesciptionPage extends StatelessWidget {
  const MidicalDesciptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: RefreshIndicator(
        onRefresh: () async {
          context
              .read<GetAllPrescriptionCubit>()
              .getAllprescription(isRefresh: true);
        },
        child: Column(
          children: [
            TitlePageWidget(
              titleText: AppWordManger.medicalDescraption,
              onTap: () => Navigator.pop(context),
              paddingBottome: 40.h,
            ),
            BlocBuilder<GetAllPrescriptionCubit, GetAllPrescriptionState>(
              builder: (context, state) {
                if (state.status == DeafultBlocStatus.loading &&
                    state.itemsList.isEmpty) {
                  return const LoadingListViewHorisontal();
                }
                return Visibility(
                  replacement: const EmptyMedicalDesciption(),
                  visible: state.itemsList.isNotEmpty,
                  child: Expanded(
                    child: ListViewWithPagenationWidget<PrescriptionItem>(
                      padding: EdgeInsets.only(
                          left: 19.w, right: 19.w, bottom: 50.h),
                      separator: SizedBox(height: 20.h),
                      haseReachedMax: state.haseReachedMax,
                      item: state.itemsList,
                      loading: state.status == DeafultBlocStatus.loading,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      childListView: (myFile, i) => CardMedicalDescription(
                        item: myFile,
                      ),
                      onNotification: (paginationEntite) => context
                          .read<GetAllPrescriptionCubit>()
                          .getAllprescription(
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
