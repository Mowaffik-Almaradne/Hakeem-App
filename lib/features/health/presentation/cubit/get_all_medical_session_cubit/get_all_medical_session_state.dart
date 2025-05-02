part of 'get_all_medical_session_cubit.dart';

class GetAllMedicalSessionState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<MedicalSessionItem> itemsList;
  final bool haseReachedMax;
  final PaginationEntity paginationEntity;
  final bool isRefresh;

  const GetAllMedicalSessionState({
    required this.paginationEntity,
    required this.itemsList,
    required this.isRefresh,
    required this.haseReachedMax,
    required this.failureMessage,
    required this.status,
  });

  factory GetAllMedicalSessionState.intial() {
    List<MedicalSessionItem> items = [];
    return GetAllMedicalSessionState(
      paginationEntity: PaginationEntity.initial(),
      haseReachedMax: false,
      isRefresh: false,
      itemsList: items,
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  GetAllMedicalSessionState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<MedicalSessionItem>? itemsList,
    bool? haseReachedMax,
    bool? isRefresh,
    PaginationEntity? paginationEntity,
  }) {
    return GetAllMedicalSessionState(
      paginationEntity: paginationEntity ?? this.paginationEntity,
      haseReachedMax: haseReachedMax ?? this.haseReachedMax,
      isRefresh: isRefresh ?? this.isRefresh,
      itemsList: itemsList ?? this.itemsList,
      failureMessage: failureMessage ?? this.failureMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        failureMessage,
        status,
        haseReachedMax,
        isRefresh,
        itemsList,
        paginationEntity
      ];
}
