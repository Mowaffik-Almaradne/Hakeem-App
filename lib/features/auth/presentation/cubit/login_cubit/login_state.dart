part of 'login_cubit.dart';

class LoginState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final LoginResponseEntitie loginResponseEntitie;
  const LoginState({
    required this.failureMessage,
    required this.status,
    required this.loginResponseEntitie,
  });

  factory LoginState.intial() {
    return LoginState(
      loginResponseEntitie: LoginResponseEntitie.fromJson({}),
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  LoginState copyWith(
      {FailureMessage? failureMessage,
      DeafultBlocStatus? status,
      LoginResponseEntitie? loginResponseEntitie}) {
    return LoginState(
      loginResponseEntitie: loginResponseEntitie ?? this.loginResponseEntitie,
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [failureMessage, status, loginResponseEntitie];
}
