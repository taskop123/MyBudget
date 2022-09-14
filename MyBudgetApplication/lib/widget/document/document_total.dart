import 'package:my_budget_application/model/document/document_data.dart';
import 'package:my_budget_application/util/formatter_utils.dart';
import 'package:my_budget_application/widget/document/document_text.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../../util/constants.dart';

/// Widget which implements the total amount
/// of the document which is to be exported.
class DocumentTotal {
  /// The data from which the document consists of.
  final DocumentData _documentData;

  /// Creates a new [DocumentTotal] object
  /// with the appropriate [_documentData].
  const DocumentTotal(this._documentData);

  /// Calculates the total summed amount of price of the expenses.
  ///
  double _calculateDocumentTotal() {
    return _documentData.items
        .map((item) => double.parse(item.expensePrice
            .replaceAll(Constants.lettersRegex, Constants.blankString)))
        .reduce((item1, item2) => item1 + item2);
  }

  Widget build() {
    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DocumentText(
                  Constants.exportTotalAmountPlaceholder,
                  FormatterUtils.formatPrice(_calculateDocumentTotal()),
                  null,
                  TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  true,
                ).build(),
                Divider(),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey300),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey300),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
