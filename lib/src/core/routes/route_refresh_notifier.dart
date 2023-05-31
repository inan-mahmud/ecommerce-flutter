import 'dart:async';

import 'package:ecommerce_flutter/src/core/utils/helpers/auth_helper.dart';
import 'package:flutter/material.dart';

class RouteRefreshNotifier extends ChangeNotifier {
  bool? _isLoggedIn;
  bool? _isInitialized;

  Future<void> onAppStart() async {
    _isLoggedIn = AuthHelper.fetchLoginState();
    _isInitialized = true;
    notifyListeners();
  }

  Future<void> updateLoginState(bool state) async {
    await AuthHelper.saveLoginState(state);
    _isLoggedIn = state;
    notifyListeners();
  }

  bool get isLoggedIn => _isLoggedIn ?? false;

  bool get isInitialized => _isInitialized ?? false;
}
