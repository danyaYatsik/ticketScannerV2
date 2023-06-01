import 'package:freezed_annotation/freezed_annotation.dart';

part 'screening.freezed.dart';

part 'screening.g.dart';

@freezed
class Screening with _$Screening {
  const factory Screening({
    required String id,
    @Default('Женя, де назва?') String name,
    @Default('Женя, де опис?') String description,
  }) = _Screening;

  factory Screening.fromJson(Map<String, dynamic> json) => _$ScreeningFromJson(json);
}
