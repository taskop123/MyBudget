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

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id.toString(),
        'price': price,
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
        'expenseAddress': expenseAddress,
        'expenseCategory': expenseCategory,
        'dateAndTime': dateAndTime?.toLocal().toString(),
        'expenseNotes': expenseNotes,
      };

  factory Expense.fromJson(var data) {
    var latitude = data['latitude'] == "null" ? "0.0" : data['latitude'];
    var longitude = data['longitude'] == "null" ? "0.0" : data['longitude'];
    return Expense(
      data['id'],
      data['price'],
      double.parse(latitude),
      double.parse(longitude),
      data['expenseAddress'],
      data['expenseCategory'],
      DateTime.parse(data['dateAndTime']),
      data['expenseNotes'],
    );
  }
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
    var expenses = map['expenses'] ?? [];

    List<Expense> listExpenses = <Expense>[];

    for (var i = 0; i < expenses.length; i++) {
      listExpenses.add(Expense.fromJson(expenses[i]));
    }

    return CustomUser(id, username, profilePicture, listExpenses);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id.toString(),
        'username': username,
        'profilePicture': profilePicture,
        'expenses': expenses.map((e) => e.toJson()).toList(),
      };

  static CustomUser? current;
}
