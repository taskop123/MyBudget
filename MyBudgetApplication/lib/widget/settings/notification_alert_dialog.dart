import 'package:flutter/material.dart';

import '../../util/constants.dart';

class NotificationAlertDialog extends StatelessWidget {
  final bool _value;
  final Function _submitFunction;

  const NotificationAlertDialog(this._value, this._submitFunction, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(Constants.warningPlaceholder),
      content: const Text(Constants.areYouSurePlaceholder),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(Constants.cancelButtonPlaceholder),
        ),
        TextButton(
          onPressed: () {
            _submitFunction(_value);
            Navigator.pop(context);
          },
          child: const Text(Constants.submitButtonPlaceholder),
        ),
      ],
    );
  }
}
