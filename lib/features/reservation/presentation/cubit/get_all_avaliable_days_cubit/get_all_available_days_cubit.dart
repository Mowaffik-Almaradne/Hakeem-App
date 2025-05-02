import 'package:bloc/bloc.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/reservation/domain/usecases/resrvation_base_use.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/get_all_avaliable_days_cubit/get_all_available_days_state.dart';

class GetAllAvaliableDaysCubit extends Cubit<GetAllAvaliableDaysState> {
  GetAllAvaliableDaysCubit({required this.useCase})
      : super(GetAllAvaliableDaysState.intial());
  final ReservationBaseUseCase useCase;
  Future<void> getAllAvaliableDays({bool? isRefrash}) async {
    if (isRefrash == true) {
      state.entitie.result.clear();
      emit(state.copyWith(status: DeafultBlocStatus.loading));
    }
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.getAllAvaliableDay();
    if (isClosed) {
      return;
    }
    data.fold(
      (failure) {
        emit(
          state.copyWith(
            isRefrash: isRefrash,
            failureMessage: mapFailureToMessage(failure: failure),
            status: DeafultBlocStatus.error,
          ),
        );
      },
      (done) {
        emit(
          state.copyWith(
            isRefrash: isRefrash,
            entitie: done,
            status: DeafultBlocStatus.done,
          ),
        );
      },
    );
  }

  void changeState(int index) {
    emit(state.copyWith(index: index));
  }
}
