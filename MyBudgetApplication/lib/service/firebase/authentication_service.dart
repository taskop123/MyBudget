import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_budget_application/service/firebase/users_repository.dart';
import 'package:my_budget_application/util/constants.dart';

import '../../model/user.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> login(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return Constants.loginSuccessMessage;
    } on FirebaseAuthException catch (e) {
      String? errorMessage = e.message;
      return (errorMessage != null)
          ? errorMessage
          : "${Constants.loginErrorMessage} $email";
    }
  }

  Future<String> register(
      {required String email,
      required String username,
      required String password}) async {
    try {
      var userCredentials = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      CustomUser customUser =
          CustomUser(userCredentials.user!.uid, username, null);
      UserRepository.addUser(customUser);
      CustomUser.current = customUser;
      return Constants.registerSuccessMessage;
    } on FirebaseAuthException catch (e) {
      String? errorMessage = e.message;
      return (errorMessage != null)
          ? errorMessage
          : "${Constants.loginErrorMessage} $email";
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
