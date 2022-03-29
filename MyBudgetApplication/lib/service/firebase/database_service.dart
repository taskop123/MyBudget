import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/util/constants.dart';

import '../../model/expense.dart';

class RealtimeDatabaseService {
  static final dbReference = FirebaseDatabase.instance;

  static void init() {
    dbReference.databaseURL = Constants.databaseUrl;
  }
}