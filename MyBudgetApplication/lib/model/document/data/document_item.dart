/// State class used for keeping data about items
/// which document exports are consisted of.
class DocumentItem {
  /// The category of the expense
  /// which is to be presented in the document row.
  final String expenseCategory;

  /// The address of the expense
  /// which is to be presented in the document row.
  final String expenseAddress;

  /// The creation date and time of the expense which
  /// is to be presented in the document row.
  final DateTime expenseDateTime;

  /// The price of the expense in dollars ($)
  /// which is to be presented in the document row.
  final String expensePrice;

  /// The additional notes of the expense
  /// which is to be presented in the document row.
  final String expenseNotes;

  /// Creates a new document item object with a specific
  /// [expenseCategory], [expenseAddress], [expenseDateTime],
  /// [expensePrice] and [expenseNotes].
  const DocumentItem({
    required this.expenseCategory,
    required this.expenseAddress,
    required this.expenseDateTime,
    required this.expensePrice,
    required this.expenseNotes,
  });
}