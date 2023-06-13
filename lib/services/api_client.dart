import 'dart:io';

import 'package:dio/dio.dart';

import '../models/order.dart';

class ApiClient {
  static late Dio _dio;

  static Dio init() {
    final options =
        BaseOptions(baseUrl: 'http://192.168.1.109:4000/api/v1', headers: {
      'Authorization':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDZlODE0Yzg4MDYwMjU3NmY2OTNjZDkiLCJpYXQiOjE2ODQ5OTM2NjQsImV4cCI6MTY4NTQyNTY2NH0.2llZ0yri8MkJoOuHosYAPxsETlMGNm8Sl3POP1nE4jg',
      'uid': '646e814c880602576f693cd9',
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
}
