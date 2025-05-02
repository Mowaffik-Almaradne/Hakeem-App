part of 'set_notifications_as_readed_cubit.dart';

class SetNotificationsAsReadedState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final int index;

  const SetNotificationsAsReadedState({
    required this.index,
    required this.failureMessage,
    required this.status,
  });

  factory SetNotificationsAsReadedState.intial() {
    return SetNotificationsAsReadedState(
      index: 0,
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  SetNotificationsAsReadedState copyWith({
    int? index,
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
  }) {
    return SetNotificationsAsReadedState(
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
