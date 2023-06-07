import 'package:dio/dio.dart';
import 'package:ticket_scanner/constants.dart';
import 'package:ticket_scanner/model/barcode_status/barcode_status.dart';
import 'package:ticket_scanner/model/just_check_result.dart';

class BarcodeRepository {
  final _dio = Dio();

  Future<BarcodeStatus> verifyBarcode({required String screeningId, required String barcode}) async {
    final response = await _dio.post('$baseUrl/check_babrcode', data: {
      'screening_code': screeningId,
      'barcode': barcode,
    });

    return BarcodeStatus.fromJson(response.data);
  }
  
  Future<JustCheckResult> justCheckBarcode(String barcode) async {
    await _dio.post('$baseUrl/check_babrcode/wa_attendie', data: {
      'barcode': barcode,
    });
    return JustCheckResult();
  }
}