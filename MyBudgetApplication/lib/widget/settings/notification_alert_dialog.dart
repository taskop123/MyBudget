import 'package:flutter/material.dart';

import '../../util/constants.dart';

/// Defines the confirm dialog which is displayed to the user.
class NotificationAlertDialog extends StatelessWidget {
  /// The flag used to store the user's decision.
  final bool _value;

  /// The function which is to be called after the decision of the user.
  final Function _submitFunction;

  /// Creates a new instance of the [NotificationAlertDialog] object
  /// with the specified [_value] and the [_submitFunction].
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
