enum Routes {
  splash,
  login,
  home,
  cart,
  settings,
}

extension RouteProperties on Routes {
  String get path {
    switch (this) {
      case Routes.splash:
        return '/splash';
      case Routes.login:
        return '/login';
      case Routes.home:
        return '/home';
      case Routes.cart:
        return '/cart';
      case Routes.settings:
        return '/settings';
    }
  }

  String get name {
    switch (this) {
      case Routes.splash:
        return 'splash';
      case Routes.login:
        return 'login';
      case Routes.home:
        return 'home';
      case Routes.cart:
        return 'cart';
      case Routes.settings:
        return 'settings';
    }
  }
}
