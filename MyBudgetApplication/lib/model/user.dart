class CustomUser {
  String? id;
  String? username;

  CustomUser(this.id, this.username);

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'id': id.toString(),
    'username': username!,
  };

  static CustomUser? current;
}