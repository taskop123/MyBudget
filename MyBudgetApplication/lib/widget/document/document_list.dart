import 'package:my_budget_application/model/document/document_data.dart';
import 'package:my_budget_application/util/formatter_utils.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pdf_widgets;

import '../../util/constants.dart';

/// Widget which implements the table list of the
/// document's data which is to be exported.
class DocumentList {
  /// The data from which the document consists of.
  final DocumentData _documentData;

  /// Creates a new [DocumentList] object
  /// with the appropriate [_documentData].
  DocumentList(this._documentData);

  /// Generates the data items from which the
  /// document table will be consisted of.
  ///
  List<List<dynamic>> _getDataItems() {
    return _documentData.items.map((item) {
      return [
        item.expenseCategory,
        item.expenseNotes,
        FormatterUtils.formatDate(item.expenseDateTime),
        item.expenseAddress,
        item.expensePrice
      ];
    }).toList();
  }

  Widget build() {
    return pdf_widgets.Table.fromTextArray(
      headers: Constants.documentHeaders,
      data: _getDataItems(),
      border: null,
      headerStyle:
          pdf_widgets.TextStyle(fontWeight: pdf_widgets.FontWeight.bold),
      headerDecoration:
          const pdf_widgets.BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: pdf_widgets.Alignment.centerLeft,
        1: pdf_widgets.Alignment.centerRight,
        2: pdf_widgets.Alignment.centerRight,
        3: pdf_widgets.Alignment.centerRight,
        4: pdf_widgets.Alignment.centerRight,
        5: pdf_widgets.Alignment.centerRight,
      },
    );
  }
}
