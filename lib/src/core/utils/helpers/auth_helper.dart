import 'package:ecommerce_flutter/src/core/di/service_locator.dart';
import 'package:ecommerce_flutter/src/core/services/cache/cache_interface.dart';
import 'dart:developer';

const authToken = 'token';
const loginKey = 'login';

class AuthHelper {
  static final _cacheService = serviceLocator.get<CacheInterface>();

  static Future<bool> saveToken(String token) async {
    return await _cacheService.save(key: authToken, value: token);
  }

  static String? fetchToken() {
    return _cacheService.read(key: authToken);
  }

  static Future<bool> saveLoginState(bool loginState) async {
    return await _cacheService.save(key: loginKey, value: loginState);
  }

  static bool fetchLoginState() {
    final state = _cacheService.read(key: loginKey) ?? false;
    log('FetchLoginState $state');
    return state;
  }

  static Future<bool> deleteToken() async {
    return await _cacheService.delete(key: authToken);
  }

  static Future<bool> logOut() async {
    return await _cacheService.delete(key: loginKey);
  }
}
