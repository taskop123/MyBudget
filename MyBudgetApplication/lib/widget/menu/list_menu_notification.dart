import 'package:flutter/material.dart';

class ListMenuNotification extends StatelessWidget {
  final int _numberNotifications;

  const ListMenuNotification(this._numberNotifications, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Colors.red,
        width: 20,
        height: 20,
        child: Center(
          child: Text(
            _numberNotifications.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
