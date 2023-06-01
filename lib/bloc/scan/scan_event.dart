part of 'scan_bloc.dart';

@freezed
class ScanEvent with _$ScanEvent{
  const factory ScanEvent.checkBarcode({required String barcode}) = _CheckBarcode;
}