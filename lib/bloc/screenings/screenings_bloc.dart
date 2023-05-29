import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticket_scanner/api/screenings_repository.dart';
import 'package:ticket_scanner/model/screening.dart';

part 'screenings_bloc.freezed.dart';

part 'screenings_state.dart';

part 'screenings_event.dart';

class ScreeningsBloc extends Bloc<ScreeningsEvent, ScreeningsState> {

  final _screeningsRepository = ScreeningsRepository();

  ScreeningsBloc() : super(const ScreeningsState(isScreeningsLoading: true)) {
    on<ScreeningsEvent>(
      (event, emit) => event.map(
        loadScreenings: (value) => _loadScreenings(emit),
      ),
    );
  }

  void _loadScreenings(Emitter<ScreeningsState> emit) async {
    emit(state.copyWith(isScreeningsLoading: true));
    final List<Screening> screenings = await _screeningsRepository.getScreenings();
    emit(state.copyWith(isScreeningsLoading: false, screenings: screenings));
  }
}
