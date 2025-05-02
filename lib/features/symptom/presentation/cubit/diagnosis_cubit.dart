import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/core/entity/pagination_entity.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/symptom/domain/entities/res/symptom_entitie.dart';
import 'package:hosptel_app/features/symptom/domain/usecases/bas_use_symptom.dart';
part 'diagnosis_state.dart';

class GetAllSymptomCubit extends Cubit<GetAllSymptomState> {
  final SymptomBaseUseCase usecase;
  List<SymptomItem> items = [];
  GetAllSymptomCubit({required this.usecase})
      : super(GetAllSymptomState.intial());
  //? Get Recent Job :
  void getAllSymptom({
    PaginationEntity? paginationEntite,
    bool? isRefresh,
  }) async {
    if (isRefresh == true) {
      state.itemsList.clear();
      emit(state.copyWith(
        status: DeafultBlocStatus.loading,
      ));
    }

    if (!state.haseReachedMax) {
      emit(state.copyWith(
        status: DeafultBlocStatus.loading,
      ));
      final result = await usecase.getAllSymptom(
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

  changeCheck() {
    emit(state.copyWith(index: state.index + 1));
  }

  visibile() {
    emit(state.copyWith(visible: !state.visible));
  }

  addIteamSymptom({required SymptomItem iteam}) {
    state.addSymptom.add(iteam);
    emit(state.copyWith(index: state.index + 1));
  }
}
