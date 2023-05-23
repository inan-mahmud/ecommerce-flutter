import 'package:ecommerce_flutter/src/core/utils/helpers/auth_helper.dart';
import 'package:flutter/material.dart';

class RouteRefreshNotifier extends ChangeNotifier {
  bool? loginState;
  

  Future<void> onAppStart() async {
    loginState = AuthHelper.fetchLoginState() ?? false;
    notifyListeners();
  }

  void updateLoginState(bool state) async {
    await AuthHelper.saveLoginState(state);
    loginState = state;
    notifyListeners();
  }
}
