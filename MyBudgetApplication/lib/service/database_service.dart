import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/util/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RealtimeDatabaseService {
  static final _firebaseDatabase = FirebaseDatabase.instance;
  static final _usersReference = _firebaseDatabase.ref().child('users');

  static void init() {
    _firebaseDatabase.databaseURL = Constants.databaseUrl;
  }

  static void addUser(CustomUser customUser) async {
    await _usersReference.push().set(customUser.toJson());
  }

  static void setUser(String? id) async {
    if (id == null || id.isEmpty) {
      return null;
    }
    _usersReference.orderByChild('id').equalTo(id).onValue.listen((event) {
      var result = (event.snapshot.value as Map<Object?, Object?>).values.first
          as Map<Object?, Object?>;
      var fetchedUser = CustomUser.fromJson(result);
      CustomUser.current = fetchedUser;
    });
  }

  static void updateUser(String? id, String? profileImage) {
    if (profileImage != null) {
      _usersReference.orderByChild('id').equalTo(id).onValue.listen((event) {
        var resultMap = (event.snapshot.value as Map<Object?, Object?>);
        var resultValue = resultMap.values.first as Map<Object?, Object?>;
        var resultKey = resultMap.keys.first as String;

        var fetchedUser = CustomUser.fromJson(resultValue);
        fetchedUser.profilePicture = profileImage;
        _usersReference
            .child(resultKey)
            .child('profilePicture')
            .set(profileImage);
        var i = 10;
      });
    }
  }

  static void addNewExpenseToUser(String? id, Expense newExpense) {
    // _usersReference.child(id!).get().then((docSnapshot) {
    //   var test = docSnapshot.value as Map<Object?, Object?>;
    //   List<Map<String, dynamic>> mappedExpenses = [];
    //   for (var i = 0; i < test.length; i++) {
    //     var temp = Expense.fromJson(test[i]);
    //     mappedExpenses.add(temp.toJson());
    //   }
    //
    //   print(mappedExpenses);
    //
    //   // print(docSnapshot.data()["email"]); // print data to test
    // });
    // getUser.once("child_added", function(snapshot){
    //   snapshot.re
    // });
    // var fetchedUser = CustomUser.fromJson(getUser);
    // List<Expense> currentUserExpenses = fetchedUser.expenses;
    // currentUserExpenses.add(newExpense); // Add the new expense to the user!
    //
    // List<Map<String, dynamic>> mappedExpenses = [];
    // for (var i = 0; i < currentUserExpenses.length; i++) {
    //   mappedExpenses.add(currentUserExpenses[i].toJson());
    // }
    //
    // _firebaseDatabase.ref("users/" + id).update({"expenses": mappedExpenses});

    _usersReference
        .orderByChild('id')
        .equalTo(id)
        .onValue
        .listen((event) {
      var resultMap = (event.snapshot.value as Map<Object?, Object?>);
      var resultValue = resultMap.values.first as Map<Object?, Object?>;
      var resultKey = resultMap.keys.first as String;

      var fetchedUser = CustomUser.fromJson(resultValue);

      List<Expense> currentUserExpenses = fetchedUser.expenses;
      currentUserExpenses.add(newExpense); // Add the new expense to the user!

      List<Map<String, dynamic>> mapped = [];
      for (var i = 0; i < currentUserExpenses.length; i++) {
        _usersReference
            .child(resultKey)
            .child('expenses')
            .update(currentUserExpenses[i].toJson());
        // mapped.add();
      }
    });
  }

  // addUser(CustomUser userData) async {
  //   await _db.collection("users").add(userData.toJson());
  // }

  static void updateUser_(String id, Expense newExpense) async {
    _usersReference
        .orderByChild('id')
        .equalTo(id)
        .onValue
        .listen((event) async {
      var resultMap = (event.snapshot.value as Map<Object?, Object?>);
      var resultValue = resultMap.values.first as Map<Object?, Object?>;
      var resultKey = resultMap.keys.first as String;
      var fetchedUser = CustomUser.fromJson(resultValue);
      List<Expense> currentUserExpenses = fetchedUser.expenses;
      currentUserExpenses.add(newExpense);

      final FirebaseFirestore _db = FirebaseFirestore.instance;

      await _db.collection("users").doc(resultKey).update(fetchedUser.toJson());
    });
  }
}

  // Future<void> deleteEmployee(String documentId) async {
  //   await _db.collection("users").doc(documentId).delete();
  // }

  // Future<List<Expense>> retrieveEmployees() async {
  //   QuerySnapshot<Map<String, dynamic>> snapshot =
  //   await _db.collection("users").get();
  //   return snapshot.docs
  //       .map((docSnapshot) => CustomUser.fromJson(docSnapshot).expenses)
  //       .toList();
  // }
