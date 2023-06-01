import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticket_scanner/model/barcode_status/barcode_status_enum/barcode_status_enum.dart';
import 'package:ticket_scanner/model/barcode_status/benefit/benefit.dart';

part 'barcode_status.freezed.dart';

part 'barcode_status.g.dart';

@freezed
class BarcodeStatus with _$BarcodeStatus {
  const factory BarcodeStatus({
    @BarcodeStatusEnumSerializer() required BarcodeStatusEnum status,
    required String description,
    @BenefitNullableJsonSerializer() Benefit? benefit,
    @JsonKey(name: 'doc_id') String? documentId,
  }) = _BarcodeStatus;

  factory BarcodeStatus.fromJson(Map<String, dynamic> json) => _$BarcodeStatusFromJson(json);
}
