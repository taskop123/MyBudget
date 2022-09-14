import 'package:firebase_database/firebase_database.dart';

import '../../model/user.dart';
import 'database_service.dart';

/// Repository used for main CRUD methods for [CustomUser] objects.
class UserRepository {
  /// The reference to the [FirebaseDatabase] db table of [CustomUser] objects.
  static final _usersReference =
      RealtimeDatabaseService.dbReference.ref().child('users');

  /// Adds a new [CustomUser] object to the [FirebaseDatabase].
  ///
  static void addUser(CustomUser customUser) async {
    await _usersReference.push().set(customUser.toJson());
  }

  /// Returns a listener stream of [DatabaseEvent],
  /// consisting of [CustomUser] object filtered by a [userId].
  ///
  static Stream<DatabaseEvent>? getUser(String? userId) {
    return _usersReference.orderByChild('id').equalTo(userId).onValue;
  }

  /// Updates the user's details such as
  /// [id], [profileImage], [monthlyIncome], [monthlyNotifications],
  /// [yearlyNotifications], as well as the flags for
  /// [monthlyNotificationsEnabled], [yearlyNotificationsEnabled],
  /// [updateProfileEnabled] and [themeDarkEnabled]
  /// to the [FirebaseDatabase] db table of [CustomUser].
  ///
  static void updateUserProfile(
      bool canUpdateProfile,
      String? id,
      String? profileImage,
      String? monthlyIncome,
      List<String>? monthlyNotifications,
      List<String>? yearlyNotifications,
      bool? monthlyNotificationsEnabled,
      bool? yearlyNotificationsEnabled,
      bool? updateProfileEnabled,
      bool? themeDarkEnabled) {
    _usersReference.orderByChild('id').equalTo(id).once().then((event) {
      var resultMap = (event.snapshot.value as Map<Object?, Object?>);
      var resultKey = resultMap.keys.first as String;

      if (canUpdateProfile) {
        _updateExpenseAttribute('profilePicture', profileImage, resultKey);
        _updateExpenseAttribute('monthlyIncome', monthlyIncome, resultKey);
        _updateExpenseAttribute(
            'monthlyNotifications', monthlyNotifications, resultKey);
        _updateExpenseAttribute(
            'yearlyNotifications', yearlyNotifications, resultKey);
      }

      _updateExpenseAttribute('monthlyNotificationsEnabled',
          monthlyNotificationsEnabled, resultKey);
      _updateExpenseAttribute(
          'yearlyNotificationsEnabled', yearlyNotificationsEnabled, resultKey);
      _updateExpenseAttribute(
          'updateProfileEnabled', updateProfileEnabled, resultKey);
      _updateExpenseAttribute('themeDarkEnabled', themeDarkEnabled, resultKey);
    });
  }

  /// Updates a details attribute of a specific
  /// expense with a [name], [value] and the [userId].
  ///
  static void _updateExpenseAttribute(String name, Object? value, var userId) {
    if (name.isNotEmpty && value != null) {
      _usersReference.child(userId).child(name).set(value);
    }
  }
}
