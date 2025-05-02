import 'package:equatable/equatable.dart';
import 'package:hosptel_app/core/function/maping_falure.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/features/reservation/domain/entities/res/get_all_available_days.dart';

class GetAllAvaliableDaysState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final GetAllAvailableDaysEntitie entitie;
  final int index;
  final bool isRefrash;
  const GetAllAvaliableDaysState({
    required this.index,
    required this.failureMessage,
    required this.status,
    required this.entitie,
    required this.isRefrash,
  });

  factory GetAllAvaliableDaysState.intial() {
    return GetAllAvaliableDaysState(
      isRefrash: false,
      index: 0,
      entitie: GetAllAvailableDaysEntitie.fromJson({}),
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  GetAllAvaliableDaysState copyWith({
    bool? isRefrash,
    int? index,
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    GetAllAvailableDaysEntitie? entitie,
  }) {
    return GetAllAvaliableDaysState(
      isRefrash: isRefrash ?? this.isRefrash,
      index: index ?? this.index,
      entitie: entitie ?? this.entitie,
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        isRefrash,
        failureMessage,
        status,
        entitie,
        index,
      ];
}
