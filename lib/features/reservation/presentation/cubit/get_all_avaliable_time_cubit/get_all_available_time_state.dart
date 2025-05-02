part of 'get_all_available_time_cubit.dart';

class GetAllAvaliableTimeState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final GetAllAvailableTimeEntitie entitie;
  final int index;
  const GetAllAvaliableTimeState({
    required this.failureMessage,
    required this.status,
    required this.entitie,
    required this.index,
  });

  factory GetAllAvaliableTimeState.intial() {
    return GetAllAvaliableTimeState(
      index: -1,
      entitie: GetAllAvailableTimeEntitie.fromJson({}),
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  GetAllAvaliableTimeState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    GetAllAvailableTimeEntitie? entitie,
    int? index,
  }) {
    return GetAllAvaliableTimeState(
      index: index ?? this.index,
      entitie: entitie ?? this.entitie,
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        failureMessage,
        status,
        entitie,
        index,
      ];
}
