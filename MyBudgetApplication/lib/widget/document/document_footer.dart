import 'package:my_budget_application/widget/document/document_simple_text.dart';
import 'package:pdf/pdf.dart' as pdf_widgets;
import 'package:pdf/widgets.dart';

import '../../model/document/document_data.dart';

class DocumentFooter {
  final DocumentData _documentData;

  const DocumentFooter(this._documentData);

  Widget build() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Divider(),
        SizedBox(height: 2 * pdf_widgets.PdfPageFormat.mm),
        DocumentSimpleText('Email', _documentData.supplier.email).build(),
        SizedBox(height: 1 * pdf_widgets.PdfPageFormat.mm),
        DocumentSimpleText('Address', _documentData.supplier.address).build(),
        SizedBox(height: 1 * pdf_widgets.PdfPageFormat.mm),
        DocumentSimpleText('Paypal', _documentData.supplier.paymentInfo)
            .build(),
      ],
    );
  }
}
