import 'package:ecommerce_flutter/src/core/di/locator.dart';
import 'package:ecommerce_flutter/src/core/services/cache/cache_interface.dart';

const authToken = 'token';
const loginKey = 'login';

class AuthHelper {
  static final cacheService = locator<CacheInterface>();

  static Future<bool> saveToken(String token) async {
    return await cacheService.save(key: authToken, value: token);
  }

  static String? fetchToken() {
    return cacheService.read(key: authToken);
  }

  static Future<bool> saveLoggedIn() async {
    return await cacheService.save(key: loginKey, value: true);
  }

  static bool isLoggedIn() {
    final result = cacheService.read(key: loginKey) ?? false;
    return result;
  }

  static Future<bool> deleteToken() async {
    return await cacheService.delete(key: authToken);
  }

  static Future<bool> logOut() async {
    return await cacheService.delete(key: loginKey);
  }
}
