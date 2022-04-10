import 'package:flutter/cupertino.dart';

/// Defines the form control widget which handles the forms in our application. 
class FormControl extends StatelessWidget {
  /// Defines the global key needed for the form.
  final GlobalKey _formKey;
  /// Defines the widgets to be displayed in the form.
  final List<Widget> _formChildren;

  /// Creates new form control widget with the given form key and the widgets
  /// to be displayed.
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
