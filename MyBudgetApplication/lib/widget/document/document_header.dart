import 'package:my_budget_application/model/document/document_customer.dart';
import 'package:my_budget_application/model/document/document_data.dart';
import 'package:my_budget_application/model/document/document_supplier.dart';
import 'package:my_budget_application/widget/document/document_text.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdf_widgets;
import 'package:pdf/widgets.dart';

import '../../util/formatter_utils.dart';

class DocumentHeader {
  final DocumentData _documentData;

  const DocumentHeader(this._documentData);

  Widget _buildSupplierAddress(Supplier _supplier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_supplier.name, style: TextStyle(fontWeight: FontWeight.bold)),
        pdf_widgets.SizedBox(height: 1 * PdfPageFormat.mm),
        Text(_supplier.address),
      ],
    );
  }

  Widget _buildCustomerAddress(Customer _customer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_customer.username, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(
            'Email: ${_customer.email}'),
        Text('Monthly Income ${_customer.monthlyIncome}'),
      ],
    );
  }

  Widget _buildInvoiceInfo(DocumentInfo _documentInfo) {
    final titles = <String>['Contact:', 'Date:'];
    final data = <String>[
      _documentData.supplier.email,
      FormatterUtils.formatDate(_documentInfo.date),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];

        return DocumentText(title, value, 200, null, false).build();
      }),
    );
  }

  Widget build() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1 * PdfPageFormat.cm),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSupplierAddress(_documentData.supplier),
            SizedBox(
              height: 50,
              width: 50,
              child: BarcodeWidget(
                barcode: Barcode.qrCode(),
                data: _documentData.info.number.toString(),
              ),
            ),
          ],
        ),
        SizedBox(height: 1 * PdfPageFormat.cm),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCustomerAddress(_documentData.customer),
            _buildInvoiceInfo(_documentData.info),
          ],
        ),
      ],
    );
  }
}
