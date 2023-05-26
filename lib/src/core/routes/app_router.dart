import 'dart:async';

import 'package:ecommerce_flutter/src/core/di/locator.dart';
import 'package:ecommerce_flutter/src/core/routes/not_found_screen.dart';
import 'package:ecommerce_flutter/src/core/routes/route_refresh_notifier.dart';
import 'package:ecommerce_flutter/src/core/routes/routes.dart';
import 'package:ecommerce_flutter/src/core/splash/splash_screen.dart';
import 'package:ecommerce_flutter/src/modules/auth/view/screens/login_screen.dart';
import 'package:ecommerce_flutter/src/modules/cart/cart_screen.dart';
import 'package:ecommerce_flutter/src/modules/categories/categories_screen.dart';
import 'package:ecommerce_flutter/src/modules/dashboard/dashrboard_screen.dart';
import 'package:ecommerce_flutter/src/modules/home/home_screen.dart';
import 'package:ecommerce_flutter/src/modules/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum NavigatorKey { root, home, cart, settings }

class AppRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: NavigatorKey.root.name);
  final GlobalKey<NavigatorState> _homeNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: NavigatorKey.home.name);
  final GlobalKey<NavigatorState> _cartNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: NavigatorKey.cart.name);
  final GlobalKey<NavigatorState> _settingsNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: NavigatorKey.settings.name);
  final RouteObserver<PageRoute> _routeObserver = RouteObserver<PageRoute>();

  late GoRouter _router;

  final _refreshNotifier = locator.get<RouteRefreshNotifier>();

  AppRouter() {
    _router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: Routes.home.path,
      debugLogDiagnostics: true,
      refreshListenable: _refreshNotifier,
      observers: [
        _routeObserver,
      ],
      redirect: _handleRedirect,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return DashboardScreen(
              navigationShell: navigationShell,
            );
          },
          branches: <StatefulShellBranch>[
            StatefulShellBranch(
              navigatorKey: _homeNavigatorKey,
              routes: <RouteBase>[
                GoRoute(
                  path: Routes.home.path,
                  name: Routes.home.name,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                      name: state.path,
                      child: HomeScreen(
                        key: state.pageKey,
                        categoriesPath: Routes.home.branchPath!,
                      ),
                    );
                  },
                  routes: <RouteBase>[
                    GoRoute(
                      path: Routes.home.branchName,
                      builder: (BuildContext context, GoRouterState state) =>
                          const CategoriesScreen(),
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _cartNavigatorKey,
              routes: <RouteBase>[
                GoRoute(
                  path: Routes.cart.path,
                  name: Routes.cart.name,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                      name: state.path,
                      child: CartScreen(
                        key: state.pageKey,
                      ),
                    );
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _settingsNavigatorKey,
              routes: <RouteBase>[
                GoRoute(
                  path: Routes.settings.path,
                  name: Routes.settings.name,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                      name: state.path,
                      child: SettingsScreen(
                        key: state.pageKey,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
            path: Routes.splash.path,
            parentNavigatorKey: _rootNavigatorKey,
            name: Routes.splash.name,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                name: state.path,
                child: const SplashScreen(),
              );
            }),
        GoRoute(
          path: Routes.login.path,
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
    // final loginLocation = state.namedLocation(Routes.login.name);
    // final homeLocation = state.namedLocation(Routes.home.name);
    final splashLocation = state.namedLocation(Routes.splash.name);
    // final isLoggedIn = _refreshNotifier.loginState;
    final isInitialized = _refreshNotifier.initialized;

    final matchedLocation = state.matchedLocation;

    // final isGoingToLogin = matchedLocation == loginLocation;
    final isGoingToInit = matchedLocation == splashLocation;

    if (!isInitialized && !isGoingToInit) {
      return splashLocation;
    }
    // } else if (isInitialized && !isLoggedIn && !isGoingToLogin) {
    //   return loginLocation;
    // } else if ((isLoggedIn && isGoingToLogin) ||
    //     (isInitialized && isGoingToInit)) {
    //   return homeLocation;
    // }
    return null;
  }

  GoRouter get router => _router;
}
