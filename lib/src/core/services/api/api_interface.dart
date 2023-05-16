import 'package:dio/dio.dart';

abstract interface class ApiInterface {
  Future<Response> get(String url, {Map<String, dynamic>? params});
  Future<Response> post(String url, {Map<String, dynamic>? data});
}
