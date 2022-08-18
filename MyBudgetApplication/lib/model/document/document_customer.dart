/// State class used for keeping customer information for document exports.
class Customer {
  /// Customer's email address used as a contact information.
  final String email;
  /// Customer's username used as a contact information.
  final String username;
  /// Customer's monthly income which he input while using the application.
  final String monthlyIncome;

  /// Creates a customer with [username], [email],
  /// as well as his [monthlyIncome].
  const Customer({
    required this.username,
    required this.email,
    required this.monthlyIncome
  });
}