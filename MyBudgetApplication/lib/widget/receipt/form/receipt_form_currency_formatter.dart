import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Defines the price input field widget used in the form when adding a new Expense
/// from an receipt image.
class ReceiptFormCurrencyField extends StatelessWidget {

  /// The [setState] function which is called on the event [onChange].
  final Function(String) _setReceiptState;

  /// The decoration text in the input field which describes what the field is
  /// about
  final String? _decorationText;

  /// The total price that the input field should have.
  final String? _totalPrice;

  /// The controller for editing the contents of the input field.
  final TextEditingController? _controller;

  /// The formatter used to format the input in currency type of format.
  final CurrencyTextInputFormatter? _formatter;

  /// The constructor of the [ReceiptFormCurrencyField] widget with
  /// [_setReceiptState], [_decorationText], [_totalPrice], [_controller] and
  /// [_formatter]
  const ReceiptFormCurrencyField(this._setReceiptState, this._decorationText,
      this._totalPrice, this._controller, this._formatter,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(_controller == null) {
      return TextFormField(
        initialValue: _totalPrice,
        decoration: InputDecoration(
          labelText: _decorationText,
        ),
        onChanged: (val) => _setReceiptState(val),
        inputFormatters:  <TextInputFormatter>[
          _formatter!,
        ],
        keyboardType: TextInputType.number,
      );
    }
    else {
      return TextFormField(
        enabled: false,
        decoration: InputDecoration(
          labelText: _decorationText,
        ),
        onChanged: (val) => {},
        controller: _controller,
        inputFormatters:  <TextInputFormatter>[
          _formatter!,
        ],
        keyboardType: TextInputType.number,
      );
    }
  }
}