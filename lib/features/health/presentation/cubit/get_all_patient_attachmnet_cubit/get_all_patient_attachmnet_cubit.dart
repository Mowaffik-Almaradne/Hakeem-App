import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/health/domain/entities/res/patient_attachmnet_entities.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use.dart';

part 'get_all_patient_attachmnet_state.dart';

class GetAllPatientAttachmnetCubit extends Cubit<GetAllPatientAttachmnetState> {
  final HealthBaseUse usecase;
  List<PatientAttachmnetItem> items = [];
  GetAllPatientAttachmnetCubit({required this.usecase})
      : super(GetAllPatientAttachmnetState.intial());
  //? Get Advertisement  :
  void getAllPatientAttachmnet({
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
      final result = await usecase.getAllPatientAttachmnet(
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
        emit(state.copyWith(
          isRefresh: isRefresh ?? false,
          haseReachedMax: items.length == data.result.totalCount,
          status: DeafultBlocStatus.done,
          itemsList: items,
        ));
      });
    }
  }

  isLoadingFile({required bool isLoading}) {
    emit(state.copyWith(isLoading: isLoading));
  }
}
