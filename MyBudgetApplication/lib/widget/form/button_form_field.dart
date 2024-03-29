import 'package:flutter/material.dart';

/// Defines the button widget used in the forms in our application.
class ButtonFormField extends StatelessWidget {
  /// Defines the text to be displayed on the button.
  final String _text;

  /// Defines the margins that the button widget should have.
  final EdgeInsets _margins;

  /// Defines a callback function that is called whenever the button is clicked.
  final Function() _onPressedFunction;

  /// The background color of the button form widget.
  final Color? _backgroundColor;

  /// The background color of the button form widget.
  final Color? _color;

  /// Creates form button widget with the given [_margins], an [_onPressedFunction],
  /// a [_text] to be displayed, a [_backgroundColor] and a text [_color].
  const ButtonFormField(this._margins, this._onPressedFunction, this._text,
      this._backgroundColor, this._color,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _margins,
      child: ElevatedButton(
        onPressed: () => _onPressedFunction(),
        child: Text(
          _text,
          style: TextStyle(fontSize: 17, color: _color),
        ),
        style: ElevatedButton.styleFrom(
          primary: _backgroundColor,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.all(8.0),
          minimumSize: const Size(350, 50),
        ),
      ),
    );
  }
}
