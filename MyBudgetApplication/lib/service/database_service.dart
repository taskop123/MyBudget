import 'package:firebase_database/firebase_database.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/util/constants.dart';

class RealtimeDatabaseService {
  static final _firebaseDatabase = FirebaseDatabase.instance;
  static final _usersReference = _firebaseDatabase.ref().child('users');

  static void init() {
    _firebaseDatabase.databaseURL = Constants.databaseUrl;
  }

  static void addUser(CustomUser customUser) async {
    await _usersReference.push().set(customUser.toJson());
  }
}