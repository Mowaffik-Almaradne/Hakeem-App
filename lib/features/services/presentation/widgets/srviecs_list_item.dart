import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/empty_data/empty_text_widget.dart';
import 'package:hosptel_app/core/widget/loading/loading_for_list.dart';
import 'package:hosptel_app/core/widget/pagination/list_view_pagination.dart';
import 'package:hosptel_app/features/services/domain/entities/res/get_all_services_entitie.dart';
import 'package:hosptel_app/features/services/presentation/cubit/services_cubit.dart';
import 'package:hosptel_app/features/services/presentation/widgets/info_services_widget.dart';

class InfoServicesListWidget extends StatelessWidget {
  const InfoServicesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllServicesCubit, GetAllServicesState>(
      builder: (context, state) {
        if (state.status == DeafultBlocStatus.loading &&
            state.itemsList.isEmpty) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: const LoadingForList(),
          );
        }
        return Visibility(
          visible: state.itemsList.isNotEmpty,
          replacement: const EmptyTextWidget(
            text: AppWordManger.noServicesAvailableAtThisTime,
          ),
          child: SizedBox(
            height: 120.h,
            child: ListViewWithPagenationWidget<ItemListServices>(
              separator: SizedBox(width: 10.w),
              haseReachedMax: state.haseReachedMax,
              item: state.itemsList,
              loading: state.status == DeafultBlocStatus.loading,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              childListView: (services, i) => InfoServices(
                services: services,
              ),
              onNotification: (paginationEntite) => context
                  .read<GetAllServicesCubit>()
                  .getAllServices(paginationEntite: paginationEntite),
            ),
          ),
        );
      },
    );
  }
}
