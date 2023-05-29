part of 'scan_bloc.dart';

@freezed
class ScanEvent with _$ScanEvent{
  const factory ScanEvent.init({required Screening screening}) = _Init;
  const factory ScanEvent.checkBarcode({required String barcode}) = _CheckBarcode;
}