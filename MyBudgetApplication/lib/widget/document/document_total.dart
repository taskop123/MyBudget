import 'package:my_budget_application/model/document/document_data.dart';
import 'package:my_budget_application/util/formatter_utils.dart';
import 'package:my_budget_application/widget/document/document_text.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../../util/constants.dart';

class DocumentTotal {
  final DocumentData _documentData;

  const DocumentTotal(this._documentData);

  Widget build() {
    final total = _documentData.items
        .map((item) => double.parse(item.expensePrice
            .replaceAll(Constants.lettersRegex, Constants.blankString)))
        .reduce((item1, item2) => item1 + item2);

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
                  'Total amount',
                  FormatterUtils.formatPrice(total),
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
