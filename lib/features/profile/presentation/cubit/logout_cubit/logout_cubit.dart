import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/profile/domain/usecases/base_use_profile.dart';
part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit({required this.useCase}) : super(LogoutState.intial());
  final ProfileBaseUseCase useCase;
  Future<void> logout() async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.logout();
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
