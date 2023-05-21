import 'package:ecommerce_flutter/src/core/utils/helpers/auth_helper.dart';
import 'package:flutter/material.dart';

class RouteRefreshNotifier extends ChangeNotifier {
  bool loginState = false;

  void updateLoginState(bool state) async {
    await AuthHelper.saveLoginState(state);
    loginState = state;
    notifyListeners();
  }
}
