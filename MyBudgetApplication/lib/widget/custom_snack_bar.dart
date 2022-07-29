import 'package:flutter/material.dart';

class CustomSnackBar {
  final String _text;

  const CustomSnackBar(this._text);

  SnackBar build() {
    return SnackBar(
      content: Text(_text),
    );
  }
}
