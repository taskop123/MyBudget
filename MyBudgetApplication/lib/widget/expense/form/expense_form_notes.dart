import 'package:flutter/material.dart';

import '../../../util/constants.dart';

class ExpenseFormNotes extends StatelessWidget {
  final Function(String) _setExpenseNotesFunction;

  const ExpenseFormNotes(this._setExpenseNotesFunction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: Constants.notesPlaceholder),
      onChanged: (val) => _setExpenseNotesFunction(val),
    );
  }
}