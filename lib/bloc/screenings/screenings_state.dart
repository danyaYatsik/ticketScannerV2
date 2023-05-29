part of 'screenings_bloc.dart';

@freezed
class ScreeningsState with _$ScreeningsState {
  const factory ScreeningsState({
    List<Screening>? screenings,
    required bool isScreeningsLoading,
}) = _ScreeningsState;
}