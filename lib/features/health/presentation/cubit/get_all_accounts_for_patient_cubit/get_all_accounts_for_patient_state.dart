part of 'get_all_accounts_for_patient_cubit.dart';

class GetAllAccountsForPatientState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<AccountsForPatientItem> itemsList;
  final GetAllAccountsForPatientEntities entities;
  final bool haseReachedMax;
  final PaginationEntity paginationEntity;
  final bool isRefresh;

  const GetAllAccountsForPatientState({
    required this.entities,
    required this.paginationEntity,
    required this.itemsList,
    required this.isRefresh,
    required this.haseReachedMax,
    required this.failureMessage,
    required this.status,
  });

  factory GetAllAccountsForPatientState.intial() {
    List<AccountsForPatientItem> items = [];
    return GetAllAccountsForPatientState(
      entities: GetAllAccountsForPatientEntities.fromJson({}),
      paginationEntity: PaginationEntity.initial(),
      haseReachedMax: false,
      isRefresh: false,
      itemsList: items,
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  GetAllAccountsForPatientState copyWith({
    FailureMessage? failureMessage,
    DeafultBlocStatus? status,
    List<AccountsForPatientItem>? itemsList,
    GetAllAccountsForPatientEntities? entities,
    bool? haseReachedMax,
    bool? isRefresh,
    PaginationEntity? paginationEntity,
  }) {
    return GetAllAccountsForPatientState(
      entities: entities ?? this.entities,
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
        entities,
        haseReachedMax,
        isRefresh,
        itemsList,
        paginationEntity
      ];
}
