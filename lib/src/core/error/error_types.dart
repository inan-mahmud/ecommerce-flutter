import 'package:ecommerce_flutter/src/core/error/error_message.dart';
import 'package:ecommerce_flutter/src/core/error/failure.dart';

enum ErrorTypes {
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError
}

extension ErrorTypesExt on ErrorTypes {
  Failure get failure {
    switch (this) {
      case ErrorTypes.badRequest:
        return Failure(ErrorMessage.badRequestError);
      case ErrorTypes.forbidden:
        return Failure(ErrorMessage.forbiddenError);
      case ErrorTypes.unauthorised:
        return Failure(ErrorMessage.unauthorizedError);
      case ErrorTypes.notFound:
        return Failure(ErrorMessage.notFoundError);
      case ErrorTypes.internalServerError:
        return Failure(ErrorMessage.internalServerError);
      case ErrorTypes.connectTimeout:
        return Failure(ErrorMessage.timeoutError);
      case ErrorTypes.cancel:
        return Failure(ErrorMessage.defaultError);
      case ErrorTypes.receiveTimeout:
        return Failure(ErrorMessage.timeoutError);
      case ErrorTypes.sendTimeout:
        return Failure(ErrorMessage.timeoutError);
      case ErrorTypes.cacheError:
        return Failure(ErrorMessage.cacheError);
      case ErrorTypes.noInternetConnection:
        return Failure(ErrorMessage.noInternetError);
      case ErrorTypes.defaultError:
        return Failure(ErrorMessage.defaultError);
      default:
        return Failure(ErrorMessage.defaultError);
    }
  }
}
