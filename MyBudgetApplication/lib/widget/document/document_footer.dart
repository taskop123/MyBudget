import 'package:my_budget_application/widget/document/document_simple_text.dart';
import 'package:pdf/pdf.dart' as pdf_widgets;
import 'package:pdf/widgets.dart';

import '../../model/document/document_data.dart';
import '../../util/constants.dart';

/// Widget which implements the footer of the document which is to be exported.
class DocumentFooter {
  /// The data from which the document consists of.
  final DocumentData _documentData;

  /// Creates a new [DocumentFooter] object
  /// with the appropriate [_documentData].
  const DocumentFooter(this._documentData);

  Widget build() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Divider(),
        SizedBox(height: 2 * pdf_widgets.PdfPageFormat.mm),
        DocumentSimpleText(
                Constants.exportEmailPlaceholder, _documentData.supplier.email)
            .build(),
        SizedBox(height: 1 * pdf_widgets.PdfPageFormat.mm),
        DocumentSimpleText(Constants.exportAddressPlaceholder,
                _documentData.supplier.address)
            .build(),
        SizedBox(height: 1 * pdf_widgets.PdfPageFormat.mm),
        DocumentSimpleText(Constants.exportPaypalPlaceholder,
                _documentData.supplier.paymentInfo)
            .build(),
      ],
    );
  }
}
