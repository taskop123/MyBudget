import 'package:flutter/material.dart';

class HelpPageButton extends StatelessWidget {
  final String _buttonText;

  const HelpPageButton(this._buttonText, {Key? key}) : super(key: key);

  TextStyle _getTextStyle() =>
      const TextStyle(fontWeight: FontWeight.bold, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Text(
      _buttonText,
      style: _getTextStyle(),
    );
  }
}
