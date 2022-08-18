import 'package:flutter/material.dart';

/// The snack which is used in our application.
class CustomSnackBar {
  /// The text to be displayed in the snack bar widget.
  final String _text;

  /// Creates a new instance of the [CustomSnackBar] widget, given the [_text].
  const CustomSnackBar(this._text);

  SnackBar build() {
    return SnackBar(
      content: Text(_text),
    );
  }
}
