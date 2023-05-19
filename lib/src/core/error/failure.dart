import 'package:ecommerce_flutter/src/core/error/error_message.dart';

class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

class DefaultFailure extends Failure {
  DefaultFailure() : super(ErrorMessage.defaultError);
}
