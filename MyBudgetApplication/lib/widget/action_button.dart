import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData _icon;
  final void Function() _clickFunction;

  const ActionButton(this._icon, this._clickFunction, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(_icon), onPressed: () => _clickFunction());
  }
}
