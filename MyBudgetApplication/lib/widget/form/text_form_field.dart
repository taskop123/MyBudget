import 'package:flutter/material.dart';

/// Defines a form text field widget for handling the 
/// text input in the forms in our application.
class FormTextField extends StatelessWidget {
  /// Defines the text editing controller which helps with managing 
  /// the user input in the text input field.
  final TextEditingController _controller;
  /// Defines the text that should be as a hint for the user.
  final String _textHint;
  /// Defines the margins of the widget.
  final EdgeInsets _margins;
  /// Defines whether this widget is used as a password text input or a 
  /// standard text input.
  final bool _isPassword;
  /// Defines the callback function that is being called whenever the user 
  /// inputs something in the input field.
  /// 
  /// It validates the user input.
  final Function(String?)? _validatorFunction;

  /// Creates new form text input widget.
  const FormTextField(this._controller, this._textHint, this._margins,
      this._isPassword, this._validatorFunction,
      {Key? key, bool obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _margins,
      child: TextFormField(
        controller: _controller,
        style: const TextStyle(color: Colors.white, fontSize: 18),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: _textHint,
            hintStyle: const TextStyle(color: Colors.white70),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white54),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            hintMaxLines: 1),
        obscureText: _isPassword,
        validator: (value) =>
            _validatorFunction != null ? _validatorFunction!(value) : null,
      ),
    );
  }
}
