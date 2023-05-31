import 'package:ecommerce_flutter/src/core/base/response.dart';

import 'package:ecommerce_flutter/src/core/di/service_locator.dart';
import 'package:ecommerce_flutter/src/core/error/error_handler.dart';
import 'package:ecommerce_flutter/src/core/error/failure.dart';
import 'package:ecommerce_flutter/src/core/services/api/api_interface.dart';
import 'package:ecommerce_flutter/src/core/utils/constants/endpoints.dart';
import 'package:ecommerce_flutter/src/core/utils/helpers/auth_helper.dart';
import 'package:ecommerce_flutter/src/modules/auth/data/models/request/auth_request.dart';
import 'package:ecommerce_flutter/src/modules/auth/data/models/response/token_model.dart';

class AuthRepository {
  final apiClient = serviceLocator<ApiInterface>();

  Future<ApiResponse<Failure, TokenModel>> signIn(AuthRequest request) async {
    try {
      final response =
          await apiClient.post(Endpoints.loginEndPoint, data: request.toMap());

      final token = TokenModel.fromMap(response.data);

      final tokenSaved = await AuthHelper.saveToken(token.token);

      if (tokenSaved) {
        return right(token);
      }
      return left(DefaultFailure());
    } catch (error) {
      return left(ErrorHandler.handleError(error).failure);
    }
  }
}
