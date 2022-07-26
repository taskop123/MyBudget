/// State class used for keeping information about user expenses.
class Expense {
  /// The id of the expense.
  String? id;

  /// The id of the user who owns the expense.
  String? userId;

  /// The total price that the expense consists of.
  String? price;

  /// The latitude of the location where the expense was created.
  double? latitude;

  /// The longitude of the location where the expense was created.
  double? longitude;

  /// The address of the location where the expense was created.
  String? expenseAddress;

  /// The category of the expense.
  String? expenseCategory;

  /// The date and time of the expense.
  DateTime? dateAndTime;

  /// The notes of the expense.
  String? expenseNotes;

  /// Creates an expense with an [id], the [userId] of the user who created it,
  /// total [price], [latitude] and [longitude] of the location of the expense,
  /// as well as the [expenseAddress], [expenseCategory],
  /// [expenseNotes] and [dateAndTime].
  ///
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

  /// Converts an [Expense] .dart object to a
  /// JSON [Map<String, dynamic>] (JavaScript Object Notation) readable object.
  ///
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

  /// Converts a JSON (JavaScript Object Notation) [data] object
  /// to an [Expense] .dart usable object.
  ///
  factory Expense.fromJson(var data) {
    String? latitude = data['latitude'].toString() == "null" ? null : data['latitude'].toString();
    String? longitude = data['longitude'].toString() == "null" ? null : data['longitude'].toString();
    return Expense(
      data['id'],
      data['userId'],
      data['price'],
      (latitude != null) ? double.parse(latitude) : null,
      (longitude != null) ? double.parse(longitude) : null,
      data['expenseAddress'],
      data['expenseCategory'],
      DateTime.parse(data['dateAndTime']),
      data['expenseNotes'],
    );
  }
}
