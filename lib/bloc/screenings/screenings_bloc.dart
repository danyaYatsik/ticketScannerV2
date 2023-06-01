import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticket_scanner/api/screenings_repository.dart';
import 'package:ticket_scanner/model/screening/screening.dart';

part 'screenings_bloc.freezed.dart';

part 'screenings_state.dart';

part 'screenings_event.dart';

class ScreeningsBloc extends Bloc<ScreeningsEvent, ScreeningsState> {
  final _screeningsRepository = ScreeningsRepository();

  ScreeningsBloc() : super(ScreeningsState.initial()) {
    on<ScreeningsEvent>(
      (event, emit) => event.map(
        loadScreenings: (_) => _loadScreenings(emit),
        toggleSearchMode: (_) => _toggleSearchMode(emit),
        search: (_Search event) => _search(emit, event.request),
      ),
    );
  }

  void _loadScreenings(Emitter<ScreeningsState> emit) async {
    emit(state.copyWith(isScreeningsLoading: true));
    final List<Screening> screenings = await _screeningsRepository.getScreenings();
    emit(state.copyWith(isScreeningsLoading: false, screenings: screenings, searchedScreenings: screenings));
  }

  void _toggleSearchMode(Emitter<ScreeningsState> emit) {
    emit(state.copyWith(isInSearchMode: !state.isInSearchMode));
    add(const ScreeningsEvent.search(''));
  }

  void _search(Emitter<ScreeningsState> emit, String request) {
    final screenings = state.screenings.where(
      (screening) => screening.name.contains(request),
    );
    emit(state.copyWith(searchedScreenings: screenings.toList()));
  }
}
