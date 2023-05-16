import 'package:dio/dio.dart';


class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // final cacheService = locator.get<JengaxCacheService>();

    // final hasLoggedIn =
    //     cacheService.containsKey(key: 'loggedIn') ? true : false;

    // if (hasLoggedIn) {
    //   options.headers['Authorization'] = 'Bearer token';
    // }
    super.onRequest(options, handler);
  }
}
