import 'package:firebase_database/firebase_database.dart';
import 'package:my_budget_application/util/constants.dart';

class RealtimeDatabaseService {
  static final dbReference = FirebaseDatabase.instance;

  static void init() {
    dbReference.databaseURL = Constants.databaseUrl;
  }
}
