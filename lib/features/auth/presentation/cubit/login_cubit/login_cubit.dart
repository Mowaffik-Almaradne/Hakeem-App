import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/features/auth/domin/entities/res/login_response_entite.dart';
import 'package:hosptel_app/features/auth/domin/usecases/auth_base_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.useCase}) : super(LoginState.intial());
  final AuthBaseUseCase useCase;
  Future<void> login({
    required String phoneNumber,
    required String password,
  }) async {
    emit(state.copyWith(status: DeafultBlocStatus.loading));
    final data =
        await useCase.login(phoneNumber: phoneNumber, password: password);
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
        AppSharedPreferences.cashToken(token: done.result?.accessToken ?? '');
        AppSharedPreferences.cashIdUser(id: done.result?.userId ?? 0);
        emit(
          state.copyWith(
            loginResponseEntitie: done,
            status: DeafultBlocStatus.done,
          ),
        );
      },
    );
  }
}
