import 'package:flutter/material.dart';

class RouteRefreshNotifier extends ChangeNotifier {
  void changeSignInStatus() async {
    notifyListeners();
  }
}
