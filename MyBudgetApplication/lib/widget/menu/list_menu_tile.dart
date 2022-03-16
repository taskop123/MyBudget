import 'package:flutter/material.dart';

class ListMenuTile extends StatelessWidget {
  final IconData _leadingIcon;
  final String _title;
  final Function()? _onTapFunction;
  final Widget? _trailingWidget;

  const ListMenuTile(
      this._leadingIcon, this._title, this._onTapFunction, this._trailingWidget,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(_leadingIcon),
      title: Text(_title),
      onTap: () => (_onTapFunction != null) ? _onTapFunction!() : null,
      trailing: (_trailingWidget != null) ? _trailingWidget : null,
    );
  }
}
