import 'package:ecommerce_flutter/src/core/di/locator.dart';
import 'package:ecommerce_flutter/src/core/services/cache/cache_interface.dart';

const authToken = 'token';
const loginKey = 'login';

class AuthHelper {
  static final _cacheService = locator<CacheInterface>();

  static Future<bool> saveToken(String token) async {
    try {
      return await _cacheService.save(key: authToken, value: token);
    } catch (e) {
      return Future.value(false);
    }
  }

  static String? fetchToken() {
    return _cacheService.read(key: authToken);
  }

  static Future<bool> saveLoginState(bool loginState) async {
    return await _cacheService.save(key: loginKey, value: loginState);
  }

  static bool fetchLoginState() {
    return _cacheService.read(key: loginKey) ?? false;
  }

  static Future<bool> deleteToken() async {
    return await _cacheService.delete(key: authToken);
  }

  static Future<bool> logOut() async {
    return await _cacheService.delete(key: loginKey);
  }
}
