part of 'create_appoinment_cubit.dart';

class CreateAppoinmentState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final int index;

  const CreateAppoinmentState({
    required this.index,
    required this.failureMessage,
    required this.status,
  });

  factory CreateAppoinmentState.intial() {
    return CreateAppoinmentState(
      index: 0,
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  CreateAppoinmentState copyWith({
    int? index,
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return CreateAppoinmentState(
      index: index ?? this.index,
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        failureMessage,
        status,
        index,
      ];
}
