import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_my_reservation.dart';
import 'package:hosptel_app/features/reservation/domain/usecases/resrvation_base_use.dart';

part 'get_all_my_reservation_state.dart';

class GetAllMyReservationCubit extends Cubit<GetAllMyReservationState> {
  final ReservationBaseUseCase usecase;
  List<MyReservationItem> itemsListIsEnded = [];
  List<MyReservationItem> itemsListIsWatting = [];
  GetAllMyReservationCubit({required this.usecase})
      : super(GetAllMyReservationState.intial());
  //? Get Recent Job :
  void getAllMyReservation({
    PaginationEntity? paginationEntite,
    bool? isRefresh,
    required bool isEnded,
  }) async {
    if (isRefresh == true) {
      // state.itemsListIsEnded.clear();
      emit(state.copyWith(
        status: DeafultBlocStatus.loading,
        isRefresh: false,
        haseReachedMax: false,
      ));
    }

    if (!state.haseReachedMax) {
      emit(state.copyWith(
        status: DeafultBlocStatus.loading,
      ));
      final result = await usecase.getAllMyReservation(
        isEnded: isEnded,
        paginationEntity: PaginationEntity.pagination(
          max: paginationEntite?.maxResultCount,
          skip: paginationEntite?.skipCount,
        ),
      );
      if (isClosed) {
        return;
      }
      result.fold((failure) {
        emit(
          state.copyWith(
            isRefresh: isRefresh ?? false,
            status: DeafultBlocStatus.error,
            paginationEntity: paginationEntite,
            failureMessage: mapFailureToMessage(
              failure: failure,
            ),
          ),
        );
      }, (data) {
        if (isEnded == true) {
          itemsListIsEnded.addAll(data.result.items);
          emit(state.copyWith(
            isRefresh: isRefresh ?? false,
            haseReachedMax: itemsListIsEnded.length == data.result.totalCount,
            status: DeafultBlocStatus.done,
            itemsListIsEnded: itemsListIsEnded,
          ));
        } else {
          itemsListIsWatting.addAll(data.result.items);
          emit(state.copyWith(
            isRefresh: isRefresh ?? false,
            haseReachedMax: itemsListIsWatting.length == data.result.totalCount,
            status: DeafultBlocStatus.done,
            itemsListIsWatting: itemsListIsWatting,
          ));
        }
      });
    }
  }

  hasTapped() {
    emit(state.copyWith(hasTapped: true));
  }
}
