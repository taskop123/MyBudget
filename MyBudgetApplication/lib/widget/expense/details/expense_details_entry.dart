import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';

import '../../info_text.dart';

/// Defines the widget with the details of the specified expense.
class ExpenseDetailsEntry extends StatelessWidget {
  /// The currently logged in user.
  final CustomUser? _currentUser;

  /// The text which will be presented in the details widget entry.
  final String _text;

  /// The margins which will be applied in the details widget entry.
  final EdgeInsets _margins;

  /// The font size which will be applied in the details widget entry.
  final double _fontSize;

  /// Creates an instance of the [ExpenseDetailsEntry] widget object
  /// with the specified [_text], [_currentUser], [_margins] and [_fontSize].
  const ExpenseDetailsEntry(
      this._text, this._currentUser, this._margins, this._fontSize,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _margins,
      child: InfoText(
          _text,
          TextStyle(
              fontSize: _fontSize,
              color: (_currentUser != null && _currentUser!.themeDarkEnabled)
                  ? Colors.white
                  : Colors.black)),
    );
  }
}
