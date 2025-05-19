part of 'general_setting_cubit.dart';

class GeneralSettingState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final GetGeneralSettingResponseEntity entity;
  const GeneralSettingState(
      {required this.status,
      required this.failureMessage,
      required this.entity});

  factory GeneralSettingState.inital() {
    return GeneralSettingState(
      status: DeafultBlocStatus.initial,
      failureMessage: FailureMessage(message: '', statusCode: 0),
      entity: GetGeneralSettingResponseEntity.fromJson({}),
    );
  }

  GeneralSettingState copyWith({
    DeafultBlocStatus? status,
    FailureMessage? failureMessage,
    GetGeneralSettingResponseEntity? entity,
  }) {
    return GeneralSettingState(
        status: status ?? this.status,
        failureMessage: failureMessage ?? this.failureMessage,
        entity: entity ?? this.entity);
  }

  @override
  List<Object?> get props => [status, failureMessage, entity];
}
