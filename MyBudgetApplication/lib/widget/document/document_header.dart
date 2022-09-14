import 'package:my_budget_application/model/document/document_customer.dart';
import 'package:my_budget_application/model/document/document_data.dart';
import 'package:my_budget_application/model/document/document_supplier.dart';
import 'package:my_budget_application/widget/document/document_text.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdf_widgets;
import 'package:pdf/widgets.dart';

import '../../model/document/data/document_info.dart';
import '../../util/constants.dart';
import '../../util/formatter_utils.dart';

/// Widget which implements the header of the document which is to be exported.
class DocumentHeader {
  /// The data from which the document consists of.
  final DocumentData _documentData;

  /// Creates a new [DocumentHeader] object
  /// with the appropriate [_documentData].
  const DocumentHeader(this._documentData);

  /// Defines the column consisting of the [_supplier] address information.
  ///
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

  /// Defines the column consisting of the [_customer] address information.
  ///
  Widget _buildCustomerAddress(Customer _customer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_customer.username, style: TextStyle(fontWeight: FontWeight.bold)),
        Text('${Constants.exportEmailPlaceholder} ${_customer.email}'),
        Text('${Constants.exportIncomePlaceholder} ${_customer.monthlyIncome}'),
      ],
    );
  }

  /// Defines the column consisting of the document's
  /// additional information: [_documentInfo].
  ///
  Widget _buildDocumentInfo(DocumentInfo _documentInfo) {
    final data = <String>[
      _documentData.supplier.email,
      FormatterUtils.formatDate(_documentInfo.date),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(Constants.exportInfoPlaceholders.length, (index) {
        final title = Constants.exportInfoPlaceholders[index];
        final value = data[index];

        return DocumentText(title, value, 200, null, false).build();
      }),
    );
  }

  /// Defines the sized box which is consisting of the document's
  /// additional barcode scanner information.
  ///
  Widget _buildBarcodeWidget() {
    return SizedBox(
      height: 50,
      width: 50,
      child: BarcodeWidget(
        barcode: Barcode.qrCode(),
        data: _documentData.info.number.toString(),
      ),
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
            _buildBarcodeWidget(),
          ],
        ),
        SizedBox(height: 1 * PdfPageFormat.cm),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCustomerAddress(_documentData.customer),
            _buildDocumentInfo(_documentData.info),
          ],
        ),
      ],
    );
  }
}
