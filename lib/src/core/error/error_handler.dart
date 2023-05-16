import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

class ApiErrorHandler {
  static const Map<DioErrorType, String> errorMessages = {
    DioErrorType.connectionTimeout: 'Connection timeout.',
    DioErrorType.receiveTimeout: 'Receive timeout.',
    DioErrorType.sendTimeout: 'Send timeout.',
    DioErrorType.cancel: 'Request cancelled.',
    DioErrorType.badResponse: 'Something went wrong, Please try again later',
    DioErrorType.unknown: 'Unknown error',
    DioErrorType.badCertificate:
        "The security certificate for this website is not valid. Please contact the website administrator for more information"
  };

  String getErrorMessage(dynamic error) {
    switch (error.runtimeType) {
      case DioError:
        return errorMessages[error.type] ?? 'Unknown error.';
      case FormatException:
        return 'Invalid response format.';
      case TimeoutException:
        return 'Request timeout.';
      case HttpException:
        return 'Http error ${error.statusCode}.';
      default:
        return 'Unknown error.';
    }
  }
}
