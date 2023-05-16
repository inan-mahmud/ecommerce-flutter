import 'package:ecommerce_flutter/src/core/di/locator.dart';
import 'package:ecommerce_flutter/src/core/services/cache/cache_interface.dart';

const authToken = 'token';

class AuthHelper {
  static final cacheService = locator<CacheInterface>();

  static Future<bool> saveToken(String token) async {
    return await cacheService.save(key: authToken, value: token);
  }

  static String? fetchToken() {
    return cacheService.read(key: authToken);
  }
}
