abstract interface class AuthListener {
  void onSignInLoading();
  void onSignInSuccess(String message);
  void onSignInError(String message);
}
