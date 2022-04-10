import 'package:flutter/material.dart';

/// Defines the list side menu tile widget used for displaying information 
/// in the side bar of our application. 
class ListMenuTile extends StatelessWidget {
  /// Defines the icon that needs to be displayed.
  final IconData _leadingIcon;
  /// Defines the title of the widget.
  final String _title;
  /// Defines the callback function for handling user interaction.
  final Function()? _onTapFunction;
  /// Defines the trailing widget.
  final Widget? _trailingWidget;

  /// Creates list side menu tile for displaying the different options 
  /// in our side menu.
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
