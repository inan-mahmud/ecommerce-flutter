enum Routes {
  splash,
  login,
  home,
  cart,
  settings;
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

  String? get branchPath {
    switch (this) {
      case Routes.splash:
        return null;
      case Routes.login:
        return null;
      case Routes.home:
        return '/home/categories';
      case Routes.cart:
        return null;
      case Routes.settings:
        return null;
    }
  }

  String get branchName {
    return branchPath?.split('/').last ?? '';
  }
}
