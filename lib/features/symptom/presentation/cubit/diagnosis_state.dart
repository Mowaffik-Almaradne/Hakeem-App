part of 'diagnosis_cubit.dart';

class GetAllSymptomState extends Equatable {
  final DeafultBlocStatus status;
  final FailureMessage failureMessage;
  final List<SymptomItem> itemsList;
  final bool haseReachedMax;
  final PaginationEntity paginationEntity;
  final bool isRefresh;
  final int index;
  final bool visible;
  final List<SymptomItem> addSymptom;
  const GetAllSymptomState({
    required this.addSymptom,
    required this.visible,
    required this.index,
    required this.paginationEntity,
    required this.itemsList,
    required this.isRefresh,
    required this.haseReachedMax,
    required this.failureMessage,
    required this.status,
  });

  factory GetAllSymptomState.intial() {
    List<SymptomItem> items = [];
    List<SymptomItem> addSymptom = [];
    return GetAllSymptomState(
      visible: false,
      index: 0,
      paginationEntity: PaginationEntity.initial(),
      haseReachedMax: false,
      addSymptom: addSymptom,
      isRefresh: false,
      itemsList: items,
      failureMessage: FailureMessage(message: '', statusCode: 0),
      status: DeafultBlocStatus.initial,
    );
  }

  GetAllSymptomState copyWith({
    FailureMessage? failureMessage,
    bool? visible,
    DeafultBlocStatus? status,
    List<SymptomItem>? itemsList,
    bool? haseReachedMax,
    bool? isRefresh,
    PaginationEntity? paginationEntity,
    int? index,
    List<SymptomItem>? addSymptom,
  }) {
    return GetAllSymptomState(
      addSymptom: addSymptom ?? this.addSymptom,
      visible: visible ?? this.visible,
      index: index ?? this.index,
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
        visible,
        status,
        addSymptom,
        haseReachedMax,
        isRefresh,
        itemsList,
        paginationEntity,
        index,
      ];
}
