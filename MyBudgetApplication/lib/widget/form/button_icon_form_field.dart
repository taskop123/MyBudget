import 'package:flutter/material.dart';
import 'package:my_budget_application/util/constants.dart';

/// Defines a button with an icon widget used in the forms in our application.
class ButtonIconFormField extends StatelessWidget {
  /// The margins which will be applied to the button icon widget.
  final EdgeInsets _margins;

  /// The function which will be called when pressing the button.
  final Function() _onPressedFunction;

  /// The icon to be displayed in the content of the button.
  final Image _icon;

  /// The background color to be applied to the button.
  final Color _backgroundColor;

  /// Creates a new instance of the [ButtonIconFormField] object,
  /// consisting of the specified [_margins], [_onPressedFunction],
  /// [_icon] and [_backgroundColor].
  const ButtonIconFormField(
      this._margins, this._onPressedFunction, this._icon, this._backgroundColor,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _margins,
      child: ElevatedButton.icon(
        onPressed: () => _onPressedFunction(),
        icon: _icon,
        label: const Text(Constants.blankString),
        style: ElevatedButton.styleFrom(
          primary: _backgroundColor,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.all(8.0),
          minimumSize: const Size(125, 50),
        ),
      ),
    );
  }
}
