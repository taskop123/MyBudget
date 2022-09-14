/// State class used for keeping supplier's information for document exports.
class Supplier {
  /// Supplier's name used as a contact application information.
  final String name;

  /// Supplier's address used as a contact application information.
  final String address;

  /// Supplier's email address used as a contact application information.
  final String email;

  /// Supplier's payment/donation information
  final String paymentInfo;

  /// Creates a supplier with [name], [address],
  /// [email], and, his [paymentInfo].
  const Supplier({
    required this.name,
    required this.address,
    required this.email,
    required this.paymentInfo,
  });
}