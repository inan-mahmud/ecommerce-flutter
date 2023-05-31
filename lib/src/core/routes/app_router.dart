import 'dart:async';

import 'package:ecommerce_flutter/src/core/di/service_locator.dart';
import 'package:ecommerce_flutter/src/core/routes/navigator_keys.dart';
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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class AppRouter {
  GoRouter get router => _router;

  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
  final _notifier = serviceLocator.get<RouteRefreshNotifier>();

  late final GoRouter _router = GoRouter(
    navigatorKey: NavigatorKeys.rootNavigatorKey,
    initialLocation: Routes.splash.path,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: serviceLocator.get<RouteRefreshNotifier>(),
    observers: [
      routeObserver,
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
            navigatorKey: NavigatorKeys.homeNavigatorKey,
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
            navigatorKey: NavigatorKeys.cartNavigatorKey,
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
            navigatorKey: NavigatorKeys.settingsNavigatorKey,
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
          parentNavigatorKey: NavigatorKeys.rootNavigatorKey,
          name: Routes.splash.name,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              name: state.path,
              child: const SplashScreen(),
            );
          }),
      GoRoute(
        path: Routes.login.path,
        parentNavigatorKey: NavigatorKeys.rootNavigatorKey,
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

   FutureOr<String?> _handleRedirect(
      BuildContext context, GoRouterState state) {

    final isLoggedIn = _notifier.isLoggedIn;
    final isInitialized = _notifier.isInitialized;

    final isGoingToLogin = state.matchedLocation == Routes.login.path;
    final isGoingToInit = state.matchedLocation == Routes.splash.path;


    if(!isInitialized){
      return Routes.splash.path;
    }
    else {
      if(!isLoggedIn && !isGoingToLogin){
        return Routes.login.path;
      }else if((isLoggedIn && isGoingToLogin) || (isInitialized && isGoingToInit)){
        return Routes.home.path;
      }
    }
    return null;
  }
}
