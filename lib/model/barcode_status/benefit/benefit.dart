import 'package:freezed_annotation/freezed_annotation.dart';

part 'benefit.freezed.dart';

@freezed
class Benefit with _$Benefit {
  const Benefit._();

  const factory Benefit.student() = _Student;

  const factory Benefit.retired() = _Retired;

  const factory Benefit.warrior() = _Warrior;

  String get displayString =>
      when(
        student: () => 'Студентський квиток',
        retired: () => 'Пенсiйне посвiдчення',
        warrior: () => 'Вiйськове посвiдчення',
      );
}

class BenefitNullableJsonSerializer extends JsonConverter<Benefit?, String?> {
  const BenefitNullableJsonSerializer();

  static const _studentKey = 'ST';
  static const _retiredKey = 'PN';
  static const _warriorKey = 'AT';

  static const _map = {
    _studentKey: Benefit.student(),
    _retiredKey: Benefit.retired(),
    _warriorKey: Benefit.warrior(),
  };

  @override
  Benefit? fromJson(String? json) {
    return _map[json];
  }

  @override
  String? toJson(Benefit? benefit) {
    return _map.entries
        .singleWhere((entry) => entry.value == benefit)
        .key;
  }
}
