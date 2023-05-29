import 'package:freezed_annotation/freezed_annotation.dart';

part 'barcode_status.freezed.dart';
part 'barcode_status.g.dart';

@freezed
class BarcodeStatus with _$BarcodeStatus {
  const factory BarcodeStatus() = _BarcodeStatus;
  factory BarcodeStatus.fromJson(Map<String, dynamic> json) => _$BarcodeStatusFromJson(json);
}