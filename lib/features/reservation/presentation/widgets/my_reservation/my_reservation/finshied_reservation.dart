import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/pagination/list_view_pagination.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_my_reservation.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/get_all_my_reservation_cubit/get_all_my_reservation_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/my_reservation/card_reservation_widget.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/my_reservation/my_reservation/empty_reservation.dart';

class FinshiedReservationWidget extends StatelessWidget {
  const FinshiedReservationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllMyReservationCubit, GetAllMyReservationState>(
      builder: (context, state) {
        if (state.status == DeafultBlocStatus.loading &&
            state.itemsListIsEnded.isEmpty) {
          return const MainLoadignWidget();
        }
        return Visibility(
          visible: state.itemsListIsEnded.isNotEmpty,
          replacement: const EmptyReservationWidget(
              mainText: AppWordManger.noExpiredReservationsAvailable),
          child: ListViewWithPagenationWidget<MyReservationItem>(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 40.h),
            haseReachedMax: state.haseReachedMax,
            item: state.itemsListIsEnded,
            separator: SizedBox(
              height: 20.h,
            ),
            loading: state.status == DeafultBlocStatus.loading,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            childListView: (item, i) => CardReservationWidget(
              height: 170,
              index: i + 1,
              item: item,
              iconCardReservatio: AppSvgManger.iconFinishedResevation,
              showButtonCancleResvation: false,
              showDivider: false,
            ),
            onNotification: (paginationEntite) => context
                .read<GetAllMyReservationCubit>()
                .getAllMyReservation(
                    paginationEntite: paginationEntite, isEnded: true),
          ),
        );
      },
    );
  }
}
