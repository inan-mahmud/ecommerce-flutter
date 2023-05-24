import 'package:ecommerce_flutter/src/core/di/locator.dart';
import 'package:ecommerce_flutter/src/core/services/cache/cache_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService<T> implements CacheInterface<T> {
  late SharedPreferences preferences;

  CacheService() {
    _init();
  }

  void _init() {
    preferences = locator.get<SharedPreferences>();
  }

  @override
  bool containsKey({required String key}) {
    return preferences.containsKey(key);
  }

  @override
  Future<bool> delete({required String key}) async {
    if (containsKey(key: key)) {
      return await preferences.remove(key);
    }
    return false;
  }

  @override
  T? read({required String key}) {
    final value = preferences.get(key);
    return value != null ? value as T : null;
  }

  @override
  Future<bool> save({required String key, T? value}) async {
    if (value is int) {
      return await preferences.setInt(key, value);
    }
    if (value is double) {
      return await preferences.setDouble(key, value);
    }
    if (value is bool) {
      return await preferences.setBool(key, value);
    }
    if (value is String) {
      return await preferences.setString(key, value);
    }
    throw Exception('Type not supported');
  }
}
