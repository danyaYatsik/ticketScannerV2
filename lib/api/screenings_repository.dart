import 'package:dio/dio.dart';
import 'package:ticket_scanner/constants.dart';
import 'package:ticket_scanner/model/screening/screening.dart';

class ScreeningsRepository {
  final _dio = Dio();

  Future<List<Screening>> getScreenings() async {
    final response = await _dio.get('$baseUrl/get_screenings');
    final data = response.data as List<dynamic>;


    return data.cast<Map<String, dynamic>>().map(Screening.fromJson).toList();
  }
}
