import 'package:ecommerce_flutter/src/core/base/response.dart';
import 'package:ecommerce_flutter/src/modules/auth/controller/auth_listener.dart';
import 'package:ecommerce_flutter/src/modules/auth/data/models/request/auth_request.dart';
import 'package:ecommerce_flutter/src/modules/auth/data/repositories/auth_repository.dart';

class AuthController {
  final AuthListener? _authListener;

  final AuthRepository _authRepository = AuthRepository();

  AuthController(this._authListener);

  Future<void> signIn(String username, String password) async {
    final authRequest = AuthRequest(
      username: username,
      password: password,
    );

    final response = await _authRepository.signIn(authRequest);
    switch (response) {
      case ApiSuccess():
        _authListener?.onSignInSuccess("Logged In Successfully");

      case ApiError():
        _authListener?.onSignInError(response.value.message);
    }
  }
}
