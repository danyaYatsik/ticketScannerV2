import 'package:dio/dio.dart';
import 'package:ticket_scanner/constants.dart';
import 'package:ticket_scanner/model/barcode_status/barcode_status.dart';

class BarcodeRepository {
  final _dio = Dio();

  Future<BarcodeStatus> checkBarcode({required String screeningId, required String barcode}) async {
    final response = await _dio.post('$baseUrl/check_babrcode', data: {
      'screening_code': screeningId,
      'barcode': barcode
    });

    return BarcodeStatus.fromJson(response.data);
  }
}