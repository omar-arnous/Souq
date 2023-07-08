import 'package:dio/dio.dart';
import 'package:souq/services/cahce_storage.dart';
import 'package:souq/utils/constants.dart';

import '../models/order.dart';

class ApiClient {
  static late Dio _dio;

  static Dio init() {
    final options = BaseOptions(baseUrl: '$kUrl/api/v1', headers: {
      'Authorization': CacheStorage.getCache(kToken),
      'uid': CacheStorage.getCache(kId),
    });
    _dio = Dio(options);
    return _dio;
  }

  static Future<Response> getProducts() async {
    final response = await _dio.get('/products');
    return response;
  }

  static Future<void> makeOrder(Order order) async {
    await _dio.post('/orders', data: order);
  }

  static Future<Response> login(json) async {
    final response = await _dio.post('/login', data: json);
    return response;
  }

  static Future<Response> signup(json) async {
    final response = await _dio.post('/signup', data: json);
    return response;
  }
}
