import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

/// Defines the button widget for displaying one of the user statistics.
class ProfileNumbersButton extends StatelessWidget {
  /// The text of the button widget.
  final String _text;

  /// The value of the button widget.
  final Object _value;

  /// The color of the button widget.
  final Color _color;

  /// The font size of the button widget.
  final double _fontSize;

  /// The text input formatter for the button widget.
  final CurrencyTextInputFormatter _formatter;

  /// Creates a new instance of the [ProfileNumbersButton]
  /// with the specified [_text], [_value], [_color], [_fontSize]
  /// and the adequate [_formatter].
  const ProfileNumbersButton(
      this._text, this._value, this._color, this._fontSize, this._formatter,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 4),
      onPressed: () {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              _formatter.format(_value.toString()),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: _fontSize,
                color: _color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              _text,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
