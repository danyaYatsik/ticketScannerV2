import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_scanner/api/barcode_repository.dart';
import 'package:ticket_scanner/bloc/just_check/just_check_event.dart';
import 'package:ticket_scanner/bloc/just_check/just_check_state.dart';

class JustCheckBloc extends Bloc<JustCheckEvent, JustCheckState> {
  final _repository = BarcodeRepository();
  
  JustCheckBloc() : super(JustCheckState.initial()) {
    on<JustCheckEvent>((event, emit) => _justCheck(event, emit));
  }

  Future<void> _justCheck(JustCheckEvent event, Emitter<JustCheckState> emit) async {
    emit(state.copyWith(isLoading: true, barcode: event.barcode));
    final result = await _repository.justCheckBarcode(event.barcode);
    emit(state.copyWith(isLoading: false, result: result));
  }
}