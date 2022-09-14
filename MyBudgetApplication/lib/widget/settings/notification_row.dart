import 'package:flutter/material.dart';

/// Defines a row displaying information about a toggle switch.
class NotificationRow extends StatelessWidget {
  /// The title of the notification row.
  final String _title;

  /// The icon of the notification row.
  final IconData _icon;

  /// Creates a new instance of the [NotificationRow] object
  /// with the specified [_title] and [_icon].
  const NotificationRow(this._title, this._icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
        Icon(_icon),
        const SizedBox(
          width: 10,
        ),
        Text(
          _title,
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
