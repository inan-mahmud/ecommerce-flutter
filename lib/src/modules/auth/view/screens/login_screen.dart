import 'package:ecommerce_flutter/src/core/common/primary_button.dart';
import 'package:ecommerce_flutter/src/core/config/app_sizes.dart';
import 'package:ecommerce_flutter/src/core/config/colors.dart';
import 'package:ecommerce_flutter/src/core/utils/helpers/dialog_helper.dart';
import 'package:ecommerce_flutter/src/core/utils/helpers/snackbar_helper.dart';
import 'package:ecommerce_flutter/src/modules/auth/controller/auth_controller.dart';
import 'package:ecommerce_flutter/src/modules/auth/controller/auth_listener.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements AuthListener {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  AuthController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AuthController(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              style: const TextStyle(
                color: AppColors.whiteColor,
              ),
            ),
            gapH24,
            TextFormField(
              controller: _passwordController,
              style: const TextStyle(
                color: AppColors.whiteColor,
              ),
            ),
            gapH24,
            PrimaryButton(
              child: const Text('Log In'),
              onPressed: () {
                _controller?.signIn(
                  _usernameController.text,
                  _passwordController.text,
                );
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void onSignInError(String message) {
    SnackbarHelper.showSnackBar(context, message);
    _dismissDialog();
  }

  @override
  void onSignInSuccess(String message) {
    SnackbarHelper.showSnackBar(context, message);
    _dismissDialog();
  }

  @override
  void onSignInLoading() {
    DialogHelper.showProgressDialog(context, "Please wait....");
  }

  void _dismissDialog() {
    DialogHelper.dismissDialog();
  }
}
