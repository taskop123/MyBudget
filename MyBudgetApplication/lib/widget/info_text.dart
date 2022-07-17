import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String _text;
  final TextStyle _textStyle;

  const InfoText(this._text, this._textStyle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      overflow: TextOverflow.fade,
      strutStyle: const StrutStyle(fontSize: 12.0),
      text: TextSpan(style: _textStyle, text: _text),
    );
  }
}
