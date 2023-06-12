import 'package:dio/dio.dart';

class ApiClient {
  static late Dio _dio;

  static Dio init() {
    final options = BaseOptions(
      baseUrl: 'http://192.168.1.109:4000/api/v1',
    );
    _dio = Dio(options);
    return _dio;
  }

  static Future<Response> getProducts() async {
    final response = await _dio.get('/products');
    return response;
  }
}
