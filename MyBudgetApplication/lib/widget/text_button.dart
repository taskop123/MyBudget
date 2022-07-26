import 'package:flutter/material.dart';

/// Defines the custom text button widget.
class CustomTextButton extends StatelessWidget {
  /// Defines the callback function used when the button is clicked.
  final Function() _onPressedFunction;
  /// Defines the text that is displayed on the button.
  final String _text;
  /// Defines the descriptive text that is displayed for the button.
  final String? _linkText;
  /// Defines the margins of the button.
  final EdgeInsets _margins;
  /// Defines the color of the text in the button.
  final Color _color;

  /// Creates new custom text button.
  const CustomTextButton(this._text, this._linkText, this._margins, this._color,
      this._onPressedFunction,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _margins,
      child: TextButton(
        onPressed: () => _onPressedFunction(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$_text ",
              style: TextStyle(color: _color, fontSize: 17),
            ),
            if (_linkText != null)
              Text(_linkText!,
                  style: TextStyle(
                      color: _color,
                      fontSize: 18,
                      decoration: TextDecoration.underline)),
          ],
        ),
      ),
    );
  }
}
