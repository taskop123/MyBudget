import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A widget containing the text with information for the user.
class InfoText extends StatelessWidget {
  /// The text to be displayed in the information widget.
  final String _text;

  /// The text style to be applied to the text information widget.
  final TextStyle _textStyle;

  /// Creates a new instance of the [InfoText]
  /// with the given [_text] and [_textStyle].
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
