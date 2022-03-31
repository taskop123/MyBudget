class CustomUser {
  String? id;
  String? username;
  String? profilePicture;

  CustomUser(this.id, this.username, this.profilePicture);

  static CustomUser fromJson(var map) {
    var id = map['id'];
    var username = map['username'];
    var profilePicture = map['profilePicture'];

    return CustomUser(id, username, profilePicture);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id.toString(),
        'username': username,
        'profilePicture': profilePicture
      };
}
