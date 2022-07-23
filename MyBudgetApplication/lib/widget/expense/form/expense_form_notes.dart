import 'package:flutter/material.dart';

import '../../../util/constants.dart';

/// Defines the Notes text input widget used in the form when adding a new Expense.
class ExpenseFormNotes extends StatelessWidget {
  /// Callback validation function called each time new input is received by the user.
  final Function(String) _setExpenseNotesFunction;

  final String? _expenseNotes;

  /// Creates the notes text input widget.
  const ExpenseFormNotes(this._setExpenseNotesFunction, this._expenseNotes,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: TextFormField(
          initialValue: (_expenseNotes != null && _expenseNotes!.isNotEmpty) ? _expenseNotes : null,
          decoration:
              const InputDecoration(labelText: Constants.notesPlaceholder),
          onChanged: (val) => _setExpenseNotesFunction(val),
        ));
  }
}
