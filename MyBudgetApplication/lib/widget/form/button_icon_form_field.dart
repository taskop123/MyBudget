import 'package:flutter/material.dart';
import 'package:my_budget_application/util/constants.dart';

class ButtonIconFormField extends StatelessWidget {
  final EdgeInsets _margins;
  final Function() _onPressedFunction;
  final Image _icon;
  final Color _backgroundColor;

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
