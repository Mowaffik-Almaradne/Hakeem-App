import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/health/domain/entities/res/accounts_for_patient_entities.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use.dart';

part 'get_all_accounts_for_patient_state.dart';

class GetAllAccountsForPatientCubit
    extends Cubit<GetAllAccountsForPatientState> {
  final HealthBaseUse usecase;
  List<AccountsForPatientItem> items = [];
  GetAllAccountsForPatientCubit({required this.usecase})
      : super(GetAllAccountsForPatientState.intial());
  //? Get Advertisement  :
  void getAllAccountsForPatient({
    PaginationEntity? paginationEntite,
    bool? isRefresh,
  }) async {
    if (isRefresh == true) {
      state.itemsList.clear();
      emit(state.copyWith(
          status: DeafultBlocStatus.loading,
          isRefresh: false,
          haseReachedMax: false));
    }

    if (!state.haseReachedMax) {
      emit(state.copyWith(
        status: DeafultBlocStatus.loading,
      ));
      final result = await usecase.getAllAccountsForPatient(
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
        items.addAll(data.result.pagedResultDto.items);

        emit(state.copyWith(
          isRefresh: isRefresh ?? false,
          haseReachedMax: items.length == data.result.pagedResultDto.totalCount,
          status: DeafultBlocStatus.done,
          itemsList: items,
          entities: data,
        ));
      });
    }
  }
}
