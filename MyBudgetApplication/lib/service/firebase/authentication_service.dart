import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_budget_application/service/firebase/users_repository.dart';
import 'package:my_budget_application/util/constants.dart';

import '../../model/user.dart';

/// Service used for the [FirebaseAuth] database.
class AuthenticationService {
  /// The instance of the [FirebaseAuth] object.
  final FirebaseAuth _firebaseAuth;

  /// Creates a singleton instance of the class with [_firebaseAuth] object.
  AuthenticationService(this._firebaseAuth);

  /// Notify all listeners about a [_firebaseAuth] change in state.
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  /// Signs in a new user with a specific [email] and [password]
  /// with the help of a [_firebaseAuth] object instance.
  ///
  /// Returns an adequate error message if the authentication is not successful.
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

  /// Creates a new user with a specific [username], [email] and [password],
  /// with the help o [_firebaseAuth] object instance to the firebase auth db
  /// [UserRepository] to the realtime db instance.
  ///
  /// Returns an adequate error message if the registration is not successful.
  Future<String> register(
      {required String email,
      required String username,
      required String password}) async {
    try {
      var userCredentials = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      CustomUser customUser = CustomUser(
          userCredentials.user!.uid,
          username,
          null,
          null,
          List.empty(growable: true),
          List.empty(growable: true),
          true,
          true,
          true,
          false);
      UserRepository.addUser(customUser);
      signOut();
      return Constants.registerSuccessMessage;
    } on FirebaseAuthException catch (e) {
      String? errorMessage = e.message;
      return (errorMessage != null)
          ? errorMessage
          : "${Constants.registerErrorMessage} $email";
    }
  }

  /// Authenticates a new user with the help o [GoogleSignIn]
  /// object instance to the 'Google' OAuth provider.
  ///
  /// Returns an adequate error message if the OAuth login is not successful.
  Future<String> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: <String>['email']).signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredentials =
          await _firebaseAuth.signInWithCredential(credential);
      CustomUser customUser = CustomUser(
          userCredentials.user!.uid,
          userCredentials.user!.displayName,
          null,
          null,
          List.empty(growable: true),
          List.empty(growable: true),
          true,
          true,
          true,
          false);
      UserRepository.addUser(customUser);

      return Constants.loginErrorMessage;
    } on FirebaseAuthException catch (e) {
      return (e.message != null) ? e.message! : Constants.loginErrorMessage;
    }
  }

  /// Authenticates a new user with the help o [FacebookAuthProvider]
  /// object instance to the 'Google' OAuth provider.
  ///
  /// Returns an adequate error message if the OAuth login is not successful.
  Future<String> loginWithFacebook() async {
    try {
      final facebookLoginResult = await FacebookAuth.instance.login();

      final credential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);
      final userCredentials =
          await _firebaseAuth.signInWithCredential(credential);

      CustomUser customUser = CustomUser(
          userCredentials.user!.uid,
          userCredentials.user!.displayName,
          null,
          null,
          List.empty(growable: true),
          List.empty(growable: true),
          true,
          true,
          true,
          false);
      UserRepository.addUser(customUser);

      return Constants.loginErrorMessage;
    } on FirebaseAuthException catch (e) {
      return (e.message != null) ? e.message! : Constants.loginErrorMessage;
    }
  }

  /// Signs out the existing user, if there is one,
  /// with the help of the [_firebaseAuth] object.
  ///
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
