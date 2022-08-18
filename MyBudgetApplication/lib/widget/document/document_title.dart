import 'package:my_budget_application/model/document/document_data.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../../util/constants.dart';

/// Widget which implements the title of the document which is to be exported.
class DocumentTitle {
  /// The data from which the document consists of.
  final DocumentData _documentData;

  /// Creates a new [DocumentTitle] object
  /// with the appropriate [_documentData].
  const DocumentTitle(this._documentData);

  Widget build() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Constants.exportTitlePlaceholder,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 0.8 * PdfPageFormat.cm),
        Text(_documentData.info.description),
        SizedBox(height: 0.8 * PdfPageFormat.cm),
      ],
    );
  }
}