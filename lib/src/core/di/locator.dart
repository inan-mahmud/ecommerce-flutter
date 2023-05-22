import 'package:dio/dio.dart';
import 'package:ecommerce_flutter/src/core/routes/route_refresh_notifier.dart';
import 'package:ecommerce_flutter/src/core/services/api/api_interceptor.dart';
import 'package:ecommerce_flutter/src/core/services/api/api_interface.dart';
import 'package:ecommerce_flutter/src/core/services/api/api_service.dart';
import 'package:ecommerce_flutter/src/core/services/cache/cache_interface.dart';
import 'package:ecommerce_flutter/src/core/services/cache/cache_service.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> init() async {
  await _initializeCache();
  _initializeRouteListenable();
  _initializeApiClient();
}

_initializeCache() async {
  locator.registerSingletonAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });

  locator.registerSingletonWithDependencies<CacheInterface>(
      () => CacheService(),
      dependsOn: [SharedPreferences]);
}

_initializeApiClient() {
  final dio = _configureDio();
  locator.registerLazySingleton<ApiInterface>(() => ApiService(dio));
}

_initializeRouteListenable() {
  locator.registerLazySingleton<RouteRefreshNotifier>(
      () => RouteRefreshNotifier());
}

Dio _configureDio() {
  final dio = Dio();
  dio.options = BaseOptions(
    baseUrl: 'https://fakestoreapi.com',
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 5000),
  );
  dio.interceptors.addAll([
    PrettyDioLogger(),
    ApiInterceptor(),
  ]);
  return dio;
}
