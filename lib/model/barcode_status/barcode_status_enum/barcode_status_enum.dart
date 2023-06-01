import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'barcode_status_enum.freezed.dart';

@freezed
class BarcodeStatusEnum with _$BarcodeStatusEnum {
  const BarcodeStatusEnum._();

  const factory BarcodeStatusEnum.ok() = Ok;

  const factory BarcodeStatusEnum.warning() = Warning;

  const factory BarcodeStatusEnum.error() = Error;

  Color get displayColor => when(
        ok: () => Colors.green,
        warning: () => Colors.yellow,
        error: () => Colors.red,
      );

  IconData get icon => when(
        ok: () => Icons.check,
        warning: () => Icons.check,
        error: () => Icons.close,
      );
}

class BarcodeStatusEnumSerializer extends JsonConverter<BarcodeStatusEnum, String> {
  const BarcodeStatusEnumSerializer();

  static const okKey = 'ok';
  static const errorKey = 'error';
  static const warningKey = 'warning';

  static const _map = {
    okKey: BarcodeStatusEnum.ok(),
    errorKey: BarcodeStatusEnum.error(),
    warningKey: BarcodeStatusEnum.warning(),
  };

  @override
  BarcodeStatusEnum fromJson(String json) {
    return _map[json]!;
  }

  @override
  String toJson(BarcodeStatusEnum object) {
    return _map.entries.singleWhere((element) => element.value == object).key;
  }
}
