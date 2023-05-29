part of 'screenings_bloc.dart';

@freezed
class ScreeningsEvent with _$ScreeningsEvent {
  const factory ScreeningsEvent.loadScreenings() = _LoadScreenings;
}