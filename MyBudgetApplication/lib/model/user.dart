/// State class used for keeping information about users saved in Realtime DB.
class CustomUser {
  /// The id of user, used for authentication, database and data storage.
  String? id;

  /// The username of the user.
  String? username;

  /// The URL of the picture of the user.
  String? profilePicture;

  /// The monthly income of the user.
  String? monthlyIncome;

  /// The settings the user has received for his income by month.
  List<String> monthlyNotifications;

  /// The settings the user has received for his income by year.
  List<String> yearlyNotifications;

  /// Flag for keeping information whether the user
  /// has monthly notifications enabled in his private settings or not.
  bool monthlyNotificationsEnabled;

  /// Flag for keeping information whether the user
  /// has yearly notifications enabled in his private settings or not.
  bool yearlyNotificationsEnabled;

  /// Flag for keeping information whether the user
  /// has permissions for updating his profile.
  bool updateProfileEnabled;

  /// Flag for keeping information whether the user
  /// has enabled dark mode, or he is using the light mode.
  bool themeDarkEnabled;

  /// Creates a user object with an [id], [username], [profilePicture] URL,
  /// specified [monthlyIncome], list of received [monthlyNotifications] and
  /// [yearlyNotifications], as well as flags for [monthlyNotificationsEnabled],
  /// [yearlyNotificationsEnabled], [updateProfileEnabled] and
  /// [themeDarkEnabled].
  CustomUser(
      this.id,
      this.username,
      this.profilePicture,
      this.monthlyIncome,
      this.monthlyNotifications,
      this.yearlyNotifications,
      this.monthlyNotificationsEnabled,
      this.yearlyNotificationsEnabled,
      this.updateProfileEnabled,
      this.themeDarkEnabled);

  /// Conversion of a JSON [map] of user information gathered from firebase,
  /// to a usable [CustomUser] object.
  ///
  /// If the [map] is empty, null is returned.
  static CustomUser? fromJson(var map) {
    if (map == null) return null;

    var id = map['id'];
    var username = map['username'];
    var profilePicture = map['profilePicture'];
    var monthlyIncome = map['monthlyIncome'];
    var monthlyNotificationsEnabled = map['monthlyNotificationsEnabled'];
    var yearlyNotificationsEnabled = map['yearlyNotificationsEnabled'];
    var updateProfileEnabled = map['updateProfileEnabled'];
    var themeDarkEnabled = map['themeDarkEnabled'];

    return CustomUser(
        id,
        username,
        profilePicture,
        monthlyIncome,
        List.empty(growable: true),
        List.empty(growable: true),
        monthlyNotificationsEnabled,
        yearlyNotificationsEnabled,
        updateProfileEnabled,
        themeDarkEnabled);
  }

  /// Converts an [CustomUser] .dart object to a
  /// JSON [Map<String, dynamic>] (JavaScript Object Notation) readable object.
  ///
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id.toString(),
        'username': username,
        'profilePicture': profilePicture,
        'monthlyIncome': monthlyIncome,
        'monthlyNotificationsEnabled': monthlyNotificationsEnabled,
        'yearlyNotificationsEnabled': yearlyNotificationsEnabled,
        'updateProfileEnabled': updateProfileEnabled,
        'themeDarkEnabled': themeDarkEnabled
      };
}
