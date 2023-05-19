import 'package:dio/dio.dart';
import 'package:ecommerce_flutter/src/core/error/error_types.dart';
import 'package:ecommerce_flutter/src/core/error/failure.dart';
import 'package:ecommerce_flutter/src/core/utils/constants/response_code.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handleError(Object error) {
    if (error is DioError) {
      failure = _handleDioError(error);
    } else {
      failure = ErrorTypes.defaultError.failure;
    }
  }

  Failure _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return ErrorTypes.connectTimeout.failure;
      case DioErrorType.badResponse:
        switch (error.response?.statusCode) {
          case ResponseCode.badRequest:
            return ErrorTypes.badRequest.failure;
          case ResponseCode.forbidden:
            return ErrorTypes.forbidden.failure;
          case ResponseCode.unauthorised:
            return ErrorTypes.unauthorised.failure;
          case ResponseCode.notFound:
            return ErrorTypes.notFound.failure;
          case ResponseCode.internalServerError:
            return ErrorTypes.internalServerError.failure;
          default:
            return ErrorTypes.defaultError.failure;
        }
      case DioErrorType.cancel:
        return ErrorTypes.cancel.failure;
      case DioErrorType.unknown:
        return ErrorTypes.defaultError.failure;
      default:
        return ErrorTypes.defaultError.failure;
    }
  }
}
