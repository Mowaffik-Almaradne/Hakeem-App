import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

class Failure extends Equatable {
  final Response? response;
  final String? error;
  const Failure({
    this.response,
    this.error,
  });

  @override
  List<Object?> get props => [response, error];

  @override
  bool get stringify => true;
}
