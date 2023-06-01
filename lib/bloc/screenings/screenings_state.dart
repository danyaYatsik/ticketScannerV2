part of 'screenings_bloc.dart';

@freezed
class ScreeningsState with _$ScreeningsState {
  const factory ScreeningsState({
    required List<Screening> screenings,
    required bool isScreeningsLoading,
    required List<Screening> searchedScreenings,
    required String searchRequest,
    required bool isInSearchMode,
  }) = _ScreeningsState;

  factory ScreeningsState.initial() => const ScreeningsState(
        screenings: [],
        isScreeningsLoading: false,
        searchedScreenings: [],
        searchRequest: '',
        isInSearchMode: false,
      );
}
