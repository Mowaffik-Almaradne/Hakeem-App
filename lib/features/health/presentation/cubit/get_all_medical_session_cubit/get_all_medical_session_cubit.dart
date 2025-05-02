import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/health/domain/entities/res/medical_session_entites.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use.dart';
part 'get_all_medical_session_state.dart';

class GetAllMedicalSessionCubit extends Cubit<GetAllMedicalSessionState> {
  final HealthBaseUse usecase;
  List<MedicalSessionItem> items = [];
  GetAllMedicalSessionCubit({required this.usecase})
      : super(GetAllMedicalSessionState.intial());
  //? Get Advertisement  :
  void getAllMedicalSession({
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
      final result = await usecase.getAllGetAllMedicalSession(
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
}
