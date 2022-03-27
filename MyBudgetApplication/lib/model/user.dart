class Expense {
  String? id;
  String? price;
  double? latitude;
  double? longitude;
  String? expenseAddress;
  String? expenseCategory;
  DateTime? dateAndTime;
  String? expenseNotes;

  Expense(
      this.id,
      this.price,
      this.latitude,
      this.longitude,
      this.expenseAddress,
      this.expenseCategory,
      this.dateAndTime,
      this.expenseNotes);

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'id': id.toString(),
        'price': price,
        'latitude': latitude,
        'longitude': longitude,
        'expenseAddress': expenseAddress,
        'expenseCategory': expenseCategory,
        'dateAndTime': dateAndTime,
        'expenseNotes': expenseNotes,
      };
}

class CustomUser {
  String? id;
  String? username;
  String? profilePicture;
  List<Expense> expenses;

  CustomUser(this.id, this.username, this.profilePicture, this.expenses);

  static CustomUser fromJson(var map) {
    var id = map['id'];
    var username = map['username'];
    var profilePicture = map['profilePicture'];
    var expenses = map['expenses'];

    return CustomUser(id, username, profilePicture, expenses);
  }

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'id': id.toString(),
        'username': username,
        'profilePicture': profilePicture,
        'expenses': expenses,
      };

  static CustomUser? current;
}
