import 'package:dio/dio.dart';
import 'package:huap_exam/configs/api_config.dart';

class DioService {
  static Dio createDio() {
    var dio = Dio(BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        receiveTimeout: 30000, // 30 seconds
        connectTimeout: 30000,
        sendTimeout: 30000,
        contentType: 'text/html'));
    return dio;
  }
}
