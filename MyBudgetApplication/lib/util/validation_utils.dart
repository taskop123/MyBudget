import 'package:my_budget_application/util/constants.dart';

/// Class which validates user textual input in our application.
class ValidationUtils {
  /// Returns true if the [username] parameter is valid
  ///
  /// Returns false if the [username] is null or is empty.
  /// Returns false if the [username] does not contain at least one number,
  /// one lower and one upper cased letter.
  static bool validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return false;
    }
    if (!Constants.usernameRegex.hasMatch(username)) {
      return false;
    }
    return true;
  }
  /// Returns true if the [email] parameter is valid
  ///
  /// Returns false if the [email] is null or is empty.
  /// Returns false if the [email] is not in a valid form.
  static bool validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }
    if (!Constants.emailRegex.hasMatch(email)) {
      return false;
    }
    return true;
  }
  /// Returns true if the [password] parameter is valid
  ///
  /// Returns false if the [password] is null, is empty or the length is
  /// less than 6 characters.
  /// Returns false if the [password] does not contain at least one number
  /// one upper or one lower cased letter and one special character.
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
