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
        _usersReference.child(resultKey).child('profilePicture').set(profileImage);
        var i =  10;
      });
    }
  }
}
