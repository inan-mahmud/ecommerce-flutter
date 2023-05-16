import 'package:dio/dio.dart';
import 'package:ecommerce_flutter/src/core/services/api/api_interface.dart';

class ApiService implements ApiInterface {
  final Dio _dio;

  ApiService(this._dio);

  @override
  Future<Response> get(String url, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(url, queryParameters: params);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> post(String url, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(url, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
