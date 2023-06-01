part of 'screenings_bloc.dart';

@freezed
class ScreeningsEvent with _$ScreeningsEvent {
  const factory ScreeningsEvent.loadScreenings() = _LoadScreenings;
  const factory ScreeningsEvent.toggleSearchMode() = _ToggleSearchMode;
  const factory ScreeningsEvent.search(String request) = _Search;
}