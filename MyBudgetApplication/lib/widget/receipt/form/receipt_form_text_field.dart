import 'package:flutter/material.dart';

/// Defines all the text input fields used in the form when adding a new Expense
/// from an receipt image.
class ReceiptFormTextField extends StatelessWidget {

  /// The setState function which is called whenever the [onChange] event occurs.
  final Function(String) _setExpenseNotesFunction;

  /// The receipt text with which the text input field is going to be populated.
  final String? _receiptText;

  /// The decoration text that describes the text input field and what is it for.
  final String _decorationText;


  /// The constructor for [ReceiptFormTextField] widget with the corresponding
  /// properties [_setExpenseNotesFunction] for state management,
  /// [_receiptText] for populating the text field and
  /// [_decorationText] for describing the text input field to the user.
  const ReceiptFormTextField(this._setExpenseNotesFunction, this._receiptText, this._decorationText,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: TextFormField(
        initialValue: (_receiptText != "null" && _receiptText!.isNotEmpty)
            ? _receiptText
            : null,
        decoration: InputDecoration(
            labelText: _decorationText
        ),
        onChanged: (val) => _setExpenseNotesFunction(val),
      )
    );
  }
}