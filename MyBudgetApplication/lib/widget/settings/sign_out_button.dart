import 'package:flutter/material.dart';

class SignOutButton extends StatelessWidget {
  final String _title;
  final Function()? _logoutFunction;

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
