import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/auth/domin/usecases/auth_base_usecase.dart';

part 'forget_password_phone_state.dart';

class ForgetPassswordPhoneCubit extends Cubit<ForgetPasswordPhoneState> {
  ForgetPassswordPhoneCubit({required this.useCase})
      : super(ForgetPasswordPhoneState.intial());
  final AuthBaseUseCase useCase;
  Future<void> forgetPasswordPhone({required String phoneNumber}) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data = await useCase.forgetPasswordPhone(phoneNumber: phoneNumber);
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
