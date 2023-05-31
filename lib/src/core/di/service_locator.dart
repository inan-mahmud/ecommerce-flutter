import 'package:dio/dio.dart';
import 'package:ecommerce_flutter/src/core/routes/app_router.dart';
import 'package:ecommerce_flutter/src/core/routes/route_refresh_notifier.dart';
import 'package:ecommerce_flutter/src/core/services/api/api_interceptor.dart';
import 'package:ecommerce_flutter/src/core/services/api/api_interface.dart';
import 'package:ecommerce_flutter/src/core/services/api/api_service.dart';
import 'package:ecommerce_flutter/src/core/services/cache/cache_interface.dart';
import 'package:ecommerce_flutter/src/core/services/cache/cache_service.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> setUpLocators() async {
  _setUpCacheService();
  _setUpRouteNotifier();
  _setUpAppRouter();
  _setUpApiClient();
}

void _setUpApiClient() {
  final dio = _configureDio();
  serviceLocator.registerLazySingleton<ApiInterface>(
    () => ApiService(dio),
  );
}

_setUpCacheService() async {
  serviceLocator.registerSingletonAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });

  serviceLocator.registerLazySingleton<CacheInterface>(
    () => CacheService(
      serviceLocator<SharedPreferences>(),
    ),
  );
}

_setUpRouteNotifier() async {
  serviceLocator.registerLazySingleton<RouteRefreshNotifier>(
    () => RouteRefreshNotifier(),
  );
}

_setUpAppRouter() {
  serviceLocator.registerLazySingleton<AppRouter>(
    () {
      return AppRouter();
    },
  );
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
