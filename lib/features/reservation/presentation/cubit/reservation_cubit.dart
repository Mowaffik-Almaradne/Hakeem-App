import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());
}
