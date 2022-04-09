/// State class used for keeping information about users saved in Realtime DB.
class CustomUser {
  /// The id of user, used for authentication, database and data storage.
  String? id;

  /// The username of the user.
  String? username;

  /// The URL of the picture of the user.
  String? profilePicture;

  /// Creates a user object with an [id], [username] and [profilePicture] URL.
  ///
  CustomUser(this.id, this.username, this.profilePicture);

  /// Conversion of a JSON [map] of user information gathered from firebase,
  /// to a usable [CustomUser] object.
  ///
  /// If the [map] is empty, null is returned.
  static CustomUser? fromJson(var map) {
    if (map == null) return null;

    var id = map['id'];
    var username = map['username'];
    var profilePicture = map['profilePicture'];

    return CustomUser(id, username, profilePicture);
  }

  /// Converts an [CustomUser] .dart object to a
  /// JSON [Map<String, dynamic>] (JavaScript Object Notation) readable object.
  ///
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id.toString(),
        'username': username,
        'profilePicture': profilePicture
      };
}
