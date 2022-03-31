import 'package:firebase_database/firebase_database.dart';

import '../../model/user.dart';
import 'database_service.dart';

class UserRepository {
  static final _usersReference =
      RealtimeDatabaseService.dbReference.ref().child('users');

  static void addUser(CustomUser customUser) async {
    await _usersReference.push().set(customUser.toJson());
  }

  static Stream<DatabaseEvent>? getUser(String? userId) {
    if (userId == null || userId.isEmpty) {
      return null;
    }

    return _usersReference.orderByChild('id').equalTo(userId).onValue;
  }

  static void updateUserProfile(String? id, String? profileImage) {
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
      });
    }
  }
}
