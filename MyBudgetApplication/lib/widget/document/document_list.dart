import 'package:my_budget_application/model/document/document_data.dart';
import 'package:my_budget_application/util/formatter_utils.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pdf_widgets;

class DocumentList {
  final DocumentData _documentData;

  const DocumentList(this._documentData);

  Widget build() {
    final headers = ['Category', 'Address', 'Date & Time', 'Notes', 'Price'];
    final data = _documentData.items.map((item) {
      return [
        item.expenseCategory,
        item.expenseAddress,
        FormatterUtils.formatDate(item.expenseDateTime),
        item.expenseNotes,
        item.expensePrice
      ];
    }).toList();

    return pdf_widgets.Table.fromTextArray(
      headers: headers,
      data: data,
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
