import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/reservation/domain/entities/req/create_appoinment_request.dart';
import 'package:hosptel_app/features/reservation/domain/usecases/resrvation_base_use.dart';
part 'create_appoinment_state.dart';

class CreateAppoinmentCubit extends Cubit<CreateAppoinmentState> {
  CreateAppoinmentCubit({required this.useCase})
      : super(CreateAppoinmentState.intial());
  final ReservationBaseUseCase useCase;
  Future<void> createAppoinment({
    required CreateAppoinmentRequest request,
  }) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.createAppoinment(request: request);
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
            status: DeafultBlocStatus.done,
          ),
        );
      },
    );
  }
}
