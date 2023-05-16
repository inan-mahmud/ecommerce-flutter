sealed class Result<T> {}

class Loading<T> extends Result<T> {}

class Success<T> extends Result<T> {
  final T value;

  Success(this.value);
}

class Error<T> extends Result<T> {
  final String message;

  Error(this.message);
}
