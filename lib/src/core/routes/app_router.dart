import 'dart:async';

import 'package:ecommerce_flutter/src/core/di/locator.dart';
import 'package:ecommerce_flutter/src/core/routes/not_found_screen.dart';
import 'package:ecommerce_flutter/src/core/routes/route_refresh_notifier.dart';
import 'package:ecommerce_flutter/src/core/routes/routes.dart';
import 'package:ecommerce_flutter/src/core/utils/helpers/auth_helper.dart';
import 'package:ecommerce_flutter/src/modules/auth/login_screen.dart';
import 'package:ecommerce_flutter/src/modules/dashboard/dashrboard_screen.dart';
import 'package:ecommerce_flutter/src/modules/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum NavigatorKey { root, shell }

class AppRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: NavigatorKey.root.name);
  final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: NavigatorKey.shell.name);
  final RouteObserver<PageRoute> _routeObserver = RouteObserver<PageRoute>();

  late GoRouter _router;

  AppRouter() {
    _router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/home',
      debugLogDiagnostics: true,
      refreshListenable: locator.get<RouteRefreshNotifier>(),
      observers: [
        _routeObserver,
      ],
      redirect: _handleRedirect,
      routes: [
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) => DashboardScreen(
                  child: child,
                ),
            routes: [
              GoRoute(
                path: '/home',
                name: Routes.home.name,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    name: state.path,
                    child: HomeScreen(
                      key: state.pageKey,
                    ),
                  );
                },
              ),
            ]),
        GoRoute(
          path: '/login',
          parentNavigatorKey: _rootNavigatorKey,
          name: Routes.login.name,
          pageBuilder: ((context, state) {
            return MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const LoginScreen(),
            );
          }),
        ),
      ],
      errorBuilder: (context, state) => const NotFoundScreen(),
    );
  }
  FutureOr<String?> _handleRedirect(BuildContext context, GoRouterState state) {
    final isLoggedIn = AuthHelper.isLoggedIn();
    final matchedLocation = state.matchedLocation;

    if (!isLoggedIn && !_isGoingToLoginOrRegister(matchedLocation)) {
      return '/login';
    } else if (isLoggedIn && _isGoingToLoginOrRegister(matchedLocation)) {
      return '/home';
    }
    return null;
  }

  bool _isGoingToLoginOrRegister(String matchedLocation) {
    return matchedLocation == '/login' || matchedLocation == '/register';
  }

  GoRouter get router => _router;

  GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;

  GlobalKey<NavigatorState> get shellNavigatorKey => _shellNavigatorKey;

  RouteObserver<PageRoute> get routeObserver => _routeObserver;
}
