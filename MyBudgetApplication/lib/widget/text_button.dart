import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Function() _onPressedFunction;
  final String _text;
  final String? _linkText;
  final EdgeInsets _margins;
  final Color _color;

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
