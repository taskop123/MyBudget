import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pdf_widgets;

class DocumentSimpleText {
  final String _title;
  final String _value;

  const DocumentSimpleText(this._title, this._value);

  Widget build() {
    final style = pdf_widgets.TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(_title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(_value),
      ],
    );
  }
}
