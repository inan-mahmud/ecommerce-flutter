import 'package:ecommerce_flutter/src/modules/auth/controller/auth_listener.dart';
import 'package:ecommerce_flutter/src/modules/auth/data/repositories/auth_repository.dart';
import 'package:flutter/foundation.dart';

class AuthController extends ChangeNotifier {
  final AuthListener _authListener;

  final AuthRepository _authRepository = AuthRepository();

  AuthController(this._authListener);

  void signIn(String userName, String password) {
    
  }
}
