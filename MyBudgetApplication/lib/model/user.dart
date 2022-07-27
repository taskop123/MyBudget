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

  /// The notifications the user has received for his income by month.
  List<String> monthlyNotifications;

  /// The notifications the user has received for his income by year.
  List<String> yearlyNotifications;

  /// Creates a user object with an [id], [username], [profilePicture] URL,[monthlyIncome], [monthlyNotifications] and [yearlyNotifications].
  ///
  CustomUser(this.id, this.username, this.profilePicture, this.monthlyIncome, this.monthlyNotifications, this.yearlyNotifications);

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

    return CustomUser(id, username, profilePicture, monthlyIncome, List.empty(growable: true), List.empty(growable: true));
  }

  /// Converts an [CustomUser] .dart object to a
  /// JSON [Map<String, dynamic>] (JavaScript Object Notation) readable object.
  ///
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id.toString(),
        'username': username,
        'profilePicture': profilePicture,
        'monthlyIncome': monthlyIncome
      };
}
