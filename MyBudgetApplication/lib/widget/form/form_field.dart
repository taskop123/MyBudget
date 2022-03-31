import 'package:flutter/cupertino.dart';

class FormControl extends StatelessWidget {
  final GlobalKey _formKey;
  final List<Widget> _formChildren;

  const FormControl(this._formKey, this._formChildren, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _formChildren),
      ),
    );
  }
}
