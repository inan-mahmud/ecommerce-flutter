
import 'package:ecommerce_flutter/src/core/di/locator.dart';
import 'package:ecommerce_flutter/src/core/services/cache/cache_interface.dart';

const authToken = 'token';
const loginKey = 'login';

class AuthHelper {
  static final _cacheService = locator<CacheInterface>();

  static Future<bool> saveToken(String token) async {
    return await _cacheService.save(key: authToken, value: token);
  }

  static String? fetchToken() {
    return _cacheService.read(key: authToken);
  }

  // static Future<bool> saveUser(String user) async {
  //   return await _cacheService.save(key: loginKey, value: user);
  // }

  // static AuthRequest? fetchUser() {
  //   final result = _cacheService.read(key: loginKey);
  //   if (result == null) {
  //     return null;
  //   }
  //   return AuthRequest.fromJson(json.decode(result));
  // }

  static Future<bool> deleteToken() async {
    return await _cacheService.delete(key: authToken);
  }

  static Future<bool> logOut() async {
    return await _cacheService.delete(key: loginKey);
  }
}
