sealed class ApiResponse<L, R> {}

class ApiError<L, R> extends ApiResponse<L, R> {
  final L value;

  ApiError(this.value);
}

class ApiSuccess<L, R> extends ApiResponse<L, R> {
  final R value;

  ApiSuccess(this.value);
}

ApiResponse<L, R> left<L, R>(L value) => ApiError(value);
ApiResponse<L, R> right<L, R>(R value) => ApiSuccess(value);
