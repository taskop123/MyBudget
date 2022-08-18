import 'package:flutter/material.dart';

/// Defines the list menu notification widget which displays
/// the notification number.
class ListMenuNotification extends StatelessWidget {
  /// Defines the notification number that is going to be displayed.
  final int _numberNotifications;

  /// Creates new list menu notification widget with the notification number
  /// that is going to be displayed with the specified [_numberNotifications].
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
