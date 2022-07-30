import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notification_alert_dialog.dart';

class NotificationOption extends StatelessWidget {
  final String _title;
  final bool _value;
  final Function _onChangeMethod;

  const NotificationOption(this._title, this._value, this._onChangeMethod,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: _value,
              onChanged: (bool newValue) {
                showDialog(
                    context: context,
                    builder: (ctx) =>
                        NotificationAlertDialog(newValue, _onChangeMethod));
              },
            ),
          ),
        ],
      ),
    );
  }
}
