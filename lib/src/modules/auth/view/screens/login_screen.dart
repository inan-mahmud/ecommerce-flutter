import 'package:ecommerce_flutter/src/core/common/primary_button.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Text(
              "LOGIN",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2661FA),
                  fontSize: 36),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Username",
              ),
              controller: _usernameController,
              style: const TextStyle(
                color: AppColors.blackColor,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Password",
              ),
              controller: _passwordController,
              style: const TextStyle(
                color: AppColors.blackColor,
              ),
              obscureText: true,
            ),
          ),
          SizedBox(height: size.height * 0.05),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: PrimaryButton(
              onPressed: () {
                _controller?.signIn(
                    _usernameController.text, _passwordController.text);
              },
              child: const Text(
                "LOGIN",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
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
