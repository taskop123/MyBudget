import 'package:my_budget_application/model/document/document_data.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class DocumentTitle {
  final DocumentData _documentData;

  const DocumentTitle(this._documentData);

  Widget build() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EXPENSES',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 0.8 * PdfPageFormat.cm),
        Text(_documentData.info.description),
        SizedBox(height: 0.8 * PdfPageFormat.cm),
      ],
    );
  }
}