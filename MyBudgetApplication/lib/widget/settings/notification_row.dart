import 'package:flutter/material.dart';

class NotificationRow extends StatelessWidget {
  final String _title;
  final IconData _icon;

  const NotificationRow(this._title, this._icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
        Icon(
          _icon,
          color: Colors.blue,
        ),
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
