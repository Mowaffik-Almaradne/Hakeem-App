import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/auth/domin/usecases/auth_base_usecase.dart';
part 'resend_code_state.dart';

class ResendCodeCubit extends Cubit<ResendCodeState> {
  ResendCodeCubit({required this.useCase}) : super(ResendCodeState.intial());
  final AuthBaseUseCase useCase;
  Future<void> resendCode({required String phoneNumber}) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.resendCode(phoneNumber: phoneNumber);
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
