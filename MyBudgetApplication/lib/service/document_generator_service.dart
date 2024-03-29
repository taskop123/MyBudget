import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/widget/document/document_header.dart';
import 'package:my_budget_application/widget/document/document_list.dart';
import 'package:my_budget_application/widget/document/document_title.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdf_widgets;
import 'package:pdf/widgets.dart';
import 'package:uuid/uuid.dart';

import '../model/document/document_data.dart';
import '../model/expense.dart';
import '../widget/document/document_footer.dart';
import '../widget/document/document_total.dart';

/// A generator document service used for manipulating with document exports.
class DocumentGenerator {
  /// Generates a new document which is exported in a PDF format,
  /// based on [_expenses], the [_currentUser]
  /// and other used information in [_user].
  ///
  static Future<File> generatePDF(
      List<Expense> _expenses, CustomUser _currentUser, User _user) async {
    final pdf = pdf_widgets.Document();
    final documentUuid = const Uuid().v1();

    final documentData =
        DocumentData.build(_expenses, _currentUser, _user, documentUuid);

    pdf.addPage(pdf_widgets.MultiPage(
      build: (context) => [
        DocumentHeader(documentData).build(),
        SizedBox(height: 2 * PdfPageFormat.cm),
        DocumentTitle(documentData).build(),
        DocumentList(documentData).build(),
        Divider(),
        DocumentTotal(documentData).build(),
      ],
      footer: (context) => DocumentFooter(documentData).build(),
    ));

    return saveDocument(name: '$documentUuid.pdf', pdf: pdf);
  }

  /// Saves the document in the file [pdf] in a PDF format,
  /// with the specified [name].
  ///
  static Future<File> saveDocument({
    required String name,
    required pdf_widgets.Document pdf,
  }) async {
    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);

    return file;
  }

  /// Opens the specified locally existing [file].
  ///
  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }
}
