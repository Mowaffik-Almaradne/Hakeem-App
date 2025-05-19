import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/empty_data/empty_text_widget.dart';
import 'package:hosptel_app/core/widget/loading/loading_back_ground.dart';
import 'package:hosptel_app/core/widget/pagination/list_view_pagination.dart';
import 'package:hosptel_app/features/health/domain/entities/res/accounts_for_patient_entities.dart';
import 'package:hosptel_app/features/health/presentation/cubit/get_all_accounts_for_patient_cubit/get_all_accounts_for_patient_cubit.dart';
import 'package:hosptel_app/features/health/presentation/widgets/mony_account/info_list_mony.dart';

class InfoMonyAccountWidget extends StatelessWidget {
  const InfoMonyAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllAccountsForPatientCubit,
        GetAllAccountsForPatientState>(
      builder: (context, state) {
        if (state.status == DeafultBlocStatus.loading &&
            state.itemsList.isEmpty) {
          return LoadingBackGroundWidget(
            height: 150,
            margin: EdgeInsets.only(bottom: 20.h, right: 25.w, left: 25.w),
          );
        }
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColorManger.fillColorCard,
              boxShadow: [
                BoxShadow(
                  color: AppColorManger.shadowColorGray.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
              borderRadius: BorderRadius.circular(5.r)),
          child: Visibility(
            visible: state.itemsList.isNotEmpty,
            replacement: const EmptyTextWidget(
              text: AppWordManger.noDetailsAccountMony,
            ),
            child: ListViewWithPagenationWidget<AccountsForPatientItem>(
              separator: SizedBox(height: 10.h),
              haseReachedMax: state.haseReachedMax,
              item: state.itemsList,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
              loading: state.status == DeafultBlocStatus.loading,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              childListView: (myAccount, i) => InfoItemDetailsMonyAccount(
                item: myAccount,
              ),
              onNotification: (paginationEntite) => context
                  .read<GetAllAccountsForPatientCubit>()
                  .getAllAccountsForPatient(paginationEntite: paginationEntite),
            ),
          ),
        );
      },
    );
  }
}
