import 'package:ecommerce_flutter/src/core/utils/helpers/auth_helper.dart';
import 'package:flutter/material.dart';

class RouteRefreshNotifier extends ChangeNotifier {
  bool? _loginState;
  bool? _initialized;

  Future<void> onAppStart() async {
    _loginState = AuthHelper.fetchLoginState();
    notifyListeners();
  }

  void updateLoginState(bool state) async {
    await AuthHelper.saveLoginState(state);
    _loginState = state;
    notifyListeners();
  }

  void initialize(bool value) {
    _initialized = value;
    notifyListeners();
  }

  bool get loginState => _loginState ?? false;
  bool get initialized => _initialized ?? false;
}
