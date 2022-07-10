import 'package:flutter/material.dart';

/// Defines the custom action button widget.
class ActionButton extends StatelessWidget {
  /// Defines the icon to be displayed on the button.
  final IconData _icon;

  /// Defines the callback function which is called when the button is clicked.
  final void Function() _clickFunction;

  /// Creates new action button widget with the given icon and a callback function.
  const ActionButton(this._icon, this._clickFunction, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(_icon), onPressed: () => _clickFunction());
  }
}