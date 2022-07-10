import 'package:firebase_database/firebase_database.dart';
import 'package:my_budget_application/util/constants.dart';

/// Service used for the realtime [FirebaseDatabase].
class RealtimeDatabaseService {
  /// The reference to the [FirebaseDatabase].
  static final dbReference = FirebaseDatabase.instance;

  /// Sets the correct and adequate database url of the realtime database
  /// and turns it into a usable [FirebaseDatabase] instance.
  ///
  static void init() {
    dbReference.databaseURL = Constants.databaseUrl;
  }
}
