import 'package:flutter/material.dart';

import '../../../util/constants.dart';

/// Defines the Notes text input widget used in the form when adding a new Expense.
class ExpenseFormNotes extends StatelessWidget {
  /// Callback validation function called each time new input is received by the user.
  final Function(String) _setExpenseNotesFunction;

  /// Creates the notes text input widget.
  const ExpenseFormNotes(this._setExpenseNotesFunction, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: TextFormField(
          decoration:
              const InputDecoration(labelText: Constants.notesPlaceholder),
          onChanged: (val) => _setExpenseNotesFunction(val),
        ));
  }
}
