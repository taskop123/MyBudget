import 'package:flutter/material.dart';

/// Defines the help page button widget.
class HelpPageButton extends StatelessWidget {
  /// Defines the text that should be displayed on the button.
  final String _buttonText;

  /// Creates new help page button widget with the given [_buttonText].
  const HelpPageButton(this._buttonText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _buttonText,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
