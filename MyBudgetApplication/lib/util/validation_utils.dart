import 'package:my_budget_application/util/constants.dart';

class ValidationUtils {
  static bool validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return false;
    }
    if (!Constants.usernameRegex.hasMatch(username)) {
      return false;
    }
    return true;
  }

  static bool validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }
    if (!Constants.emailRegex.hasMatch(email)) {
      return false;
    }
    return true;
  }

  static bool validatePassword(String? password) {
    if (password == null || password.isEmpty || password.length < 6) {
      return false;
    }
    if (!Constants.passwordRegex.hasMatch(password)) {
      return false;
    }
    return true;
  }
}
