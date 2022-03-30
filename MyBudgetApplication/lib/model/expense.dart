class Expense {
  String? id;
  String? userId;
  String? price;
  double? latitude;
  double? longitude;
  String? expenseAddress;
  String? expenseCategory;
  DateTime? dateAndTime;
  String? expenseNotes;

  Expense(
      this.id,
      this.userId,
      this.price,
      this.latitude,
      this.longitude,
      this.expenseAddress,
      this.expenseCategory,
      this.dateAndTime,
      this.expenseNotes);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id.toString(),
        'userId': userId.toString(),
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
      data['userId'],
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
