enum AuthMode {
  LOGIN,
  SIGNUP,
}

class AuthData {
  String name;
  String email;
  String password;
  AuthMode _mode = AuthMode.LOGIN;

  bool get isSignUp {
    return _mode == AuthMode.SIGNUP;
  }

  bool get isSignIn {
    return _mode == AuthMode.LOGIN;
  }

  void toggleMode() {
    _mode = _mode == AuthMode.LOGIN ? AuthMode.SIGNUP : AuthMode.LOGIN;
  }
}
