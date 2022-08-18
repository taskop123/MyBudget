import 'package:flutter/material.dart';

/// A button which signs out the currently logged in user.
class SignOutButton extends StatelessWidget {
  /// The title of the button to be displayed.
  final String _title;

  /// The function which is to be called after confirming the logout action.
  final Function()? _logoutFunction;

  /// Creates a new instance of the [SignOutButton] object
  /// with the specified [_title] and [_logoutFunction].
  const SignOutButton(this._title, this._logoutFunction, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
        onPressed: () {
          Navigator.pop(context);
          _logoutFunction!();
        },
        child: Text(
          _title,
          style: const TextStyle(fontSize: 20, letterSpacing: 2.2),
        ),
      ),
    );
  }
}
