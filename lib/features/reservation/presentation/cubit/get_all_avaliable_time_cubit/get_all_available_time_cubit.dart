import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_avaliable_time.dart';
import 'package:hosptel_app/features/reservation/domain/usecases/resrvation_base_use.dart';
part 'get_all_available_time_state.dart';

class GetAllAvaliableTimeCubit extends Cubit<GetAllAvaliableTimeState> {
  GetAllAvaliableTimeCubit({required this.useCase})
      : super(GetAllAvaliableTimeState.intial());
  final ReservationBaseUseCase useCase;
  Future<void> getAllAvaliableDays({required DateTime date}) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.getAllAvaliableTime(date: date);
    if (isClosed) {
      return;
    }
    data.fold(
      (failure) {
        emit(
          state.copyWith(
            failureMessage: mapFailureToMessage(failure: failure),
            status: DeafultBlocStatus.error,
          ),
        );
      },
      (done) {
        emit(
          state.copyWith(
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
