import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pdf_widgets;

/// Widget which creates a simple text row for the document to be exported.
class DocumentSimpleText {
  /// The title of the simple text to be created.
  final String _title;

  /// The value of the simple text to be created.
  final String _value;

  /// Creates a new instance of [DocumentSimpleText]
  /// with a specific [_title] and [_value].
  const DocumentSimpleText(this._title, this._value);

  Widget build() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(_title, style: pdf_widgets.TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(_value),
      ],
    );
  }
}
