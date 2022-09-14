/// State class used for keeping basic general information about document exports.
class DocumentInfo {

  /// Document's number used as identification information.
  final String number;

  /// Document's description used as explanation information in the header.
  final String description;

  /// Document's creation date.
  final DateTime date;

  /// Creates a document's information object with
  /// a specific [number], [description] and [date].
  const DocumentInfo(
      {required this.number, required this.description, required this.date});
}