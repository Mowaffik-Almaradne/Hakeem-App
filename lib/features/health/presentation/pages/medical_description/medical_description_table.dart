import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/main/main_app_bar/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/repeted/titel_pages_widget.dart';
import 'package:hosptel_app/core/widget/pagination/list_view_pagination.dart';
import 'package:hosptel_app/features/health/domain/entities/res/prescription_details_entities.dart';
import 'package:hosptel_app/features/health/domain/entities/res/prescription_get_all_entities.dart';
import 'package:hosptel_app/features/health/presentation/cubit/get_all_prescription_details_cubit/get_all_prescription_details_cubit.dart';
import 'package:hosptel_app/features/health/presentation/widgets/medical_description/filed_decription_medical.dart';
import 'package:hosptel_app/features/health/presentation/widgets/medical_description/info_table_medcal_item.dart';

class MedicalDescriptionTablePage extends StatelessWidget {
  const MedicalDescriptionTablePage({super.key, required this.item});
  final PrescriptionItem item;
  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: Column(
        children: [
          TitlePageWidget(
            titleText: AppWordManger.medicalDescraption,
            onTap: () => Navigator.pop(context),
            paddingBottome: 40.h,
          ),
          Container(
            width: 350.w,
            height: 380.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColorManger.secoundryColor,
                width: 1.5.w,
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: BlocBuilder<GetAllPrescriptionDetailsCubit,
                GetAllPrescriptionDetailsState>(
              builder: (context, state) {
                if (state.status == DeafultBlocStatus.loading &&
                    state.itemsList.isEmpty) {
                  return const MainLoadignWidget();
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    context
                        .read<GetAllPrescriptionDetailsCubit>()
                        .getAllDetailsprescription(
                            id: item.id, isRefresh: true);
                  },
                  child: Column(
                    children: [
                      const FiledDescriptionMedical(
                        nameMedicine: AppWordManger.nameMedicine,
                        timeOfUse: AppWordManger.timeOfUse,
                        periodOfUse: AppWordManger.periodOfUse,
                        showText: true,
                      ),
                      //? Elemant Datat :
                      Expanded(
                        child: ListViewWithPagenationWidget<
                            PrescriptionDetailsItem>(
                          separator: SizedBox(height: 15.h),
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          haseReachedMax: state.haseReachedMax,
                          item: state.itemsList,
                          loading: state.status == DeafultBlocStatus.loading,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          childListView: (myItem, i) =>
                              MedicalDescriptionTableInfo(
                            item: myItem,
                          ),
                          onNotification: (paginationEntite) => context
                              .read<GetAllPrescriptionDetailsCubit>()
                              .getAllDetailsprescription(
                                  id: item.id,
                                  paginationEntite: paginationEntite),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


/*
// VerticalDivider(
                        //   color:
                        //       AppColorManger.lineDividerColor.withOpacity(0.74),
                        //   thickness: 2.w,
                        // ),
                        // VerticalDivider(
                        //   color:
                        //       AppColorManger.lineDividerColor.withOpacity(0.74),
                        //   thickness: 2.w,
                        // ),
                        // VerticalDivider(
                        //   color:
                        //       AppColorManger.lineDividerColor.withOpacity(0.74),
                        //   thickness: 2.w,
                        // ),
*/
