part of 'scan_bloc.dart';

@freezed
class ScanState with _$ScanState {
  const factory ScanState({
    required Screening screening,
    String? barcode,
    BarcodeStatus? barcodeStatus,
  }) = _ScanState;
}
