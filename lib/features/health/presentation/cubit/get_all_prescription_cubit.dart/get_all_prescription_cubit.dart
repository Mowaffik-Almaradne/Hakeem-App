import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/health/domain/entities/res/prescription_get_all_entities.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use.dart';
part 'get_all_prescription_state.dart';

class GetAllPrescriptionCubit extends Cubit<GetAllPrescriptionState> {
  final HealthBaseUse usecase;
  List<PrescriptionItem> items = [];
  GetAllPrescriptionCubit({required this.usecase})
      : super(GetAllPrescriptionState.intial());
  //? Get Advertisement  :
  void getAllprescription({
    PaginationEntity? paginationEntite,
    bool? isRefresh,
  }) async {
    if (isRefresh == true) {
      state.itemsList.clear();
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
      final result = await usecase.getAllPatientPrescription(
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
        items.addAll(data.result.items);
        bool haseReachedMax =
            items.isEmpty || items.length == data.result.totalCount;
        emit(state.copyWith(
          isRefresh: isRefresh ?? false,
          haseReachedMax: haseReachedMax,
          status: DeafultBlocStatus.done,
          itemsList: items,
        ));
      });
    }
  }
}
