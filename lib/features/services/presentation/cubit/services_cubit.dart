import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/services/domain/entities/res/get_all_services_entitie.dart';
import 'package:hosptel_app/features/services/domain/usecases/services_base_case.dart';
part 'services_state.dart';

class GetAllServicesCubit extends Cubit<GetAllServicesState> {
  final ServicesBaseCase usecase;
  List<ItemListServices> items = [];
  GetAllServicesCubit({required this.usecase})
      : super(GetAllServicesState.intial());
  //? Get Recent Job :
  void getAllServices({
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
      final result = await usecase.getAllServices(
        pagination: PaginationEntity.pagination(
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
