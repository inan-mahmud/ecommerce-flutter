import 'package:ecommerce_flutter/src/core/config/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DialogHelper {
  static bool _isShowing = false;
  static BuildContext? _context;

  static void _init(BuildContext context) {
    _isShowing = true;
    _context = context;
  }

  static void showProgressDialog(BuildContext context, String message) {
    _init(context);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                gapW20,
                Text(message),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showErrorDialog(BuildContext context, String errorMessage) {
    _init(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void showConfirmationDialog(
      BuildContext context, String message, Function onConfirm) {
    _init(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                context.pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                onConfirm();
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void dismissDialog() {
    if (_isShowing) {
      _context?.pop();
      _isShowing = false;
    }
  }
}
