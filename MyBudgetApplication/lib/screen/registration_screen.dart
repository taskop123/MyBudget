import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/util/constants.dart';
import 'package:my_budget_application/util/validation_utils.dart';
import 'package:my_budget_application/widget/form/button_form_field.dart';
import 'package:my_budget_application/widget/form/form_field.dart';
import 'package:my_budget_application/widget/form/text_form_field.dart';
import 'package:my_budget_application/widget/popup_menu.dart';
import 'package:my_budget_application/widget/text_button.dart';
import 'package:provider/provider.dart';

import '../service/authentication_service.dart';
import '../widget/image_banner.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = Constants.registerRoute;

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late BuildContext _buildContext;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _validateInput(String? username, String? password, String? email) {
    if (!ValidationUtils.validateUsername(username)) {
      ScaffoldMessenger.of(_buildContext).showSnackBar(const SnackBar(
        content: Text(Constants.usernameValidation),
        duration: Duration(seconds: 1),
      ));
      return false;
    }
    if (!ValidationUtils.validateEmail(email)) {
      ScaffoldMessenger.of(_buildContext).showSnackBar(const SnackBar(
        content: Text(Constants.emailValidation),
        duration: Duration(seconds: 1),
      ));
      return false;
    }
    if (!ValidationUtils.validatePassword(password)) {
      ScaffoldMessenger.of(_buildContext).showSnackBar(const SnackBar(
        content: Text(Constants.passwordValidation),
        duration: Duration(seconds: 1),
      ));
      return false;
    }

    return true;
  }

  void _registerUser() async {
    var username = _usernameController.text;
    var email = _emailController.text;
    var password = _passwordController.text;

    if (!_validateInput(username, password, email)) {
      return;
    }
    String result = await _buildContext
        .read<AuthenticationService>()
        .register(email: email, username: username, password: password);
    ScaffoldMessenger.of(_buildContext).showSnackBar(SnackBar(
      content: Text(result.toString()),
      duration: const Duration(seconds: 3),
    ));

    if (CustomUser.current != null) {
      await _buildContext.read<AuthenticationService>().signOut();
      _navigateLoginUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    _buildContext = context;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.registrationTitle),
        backgroundColor: Colors.lightBlue,
        actions: const [
          PopupMenu(),
        ],
      ),
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 30),
        child: FormControl(_formKey, [
          const ImageBanner(Constants.logoUrl),
          FormTextField(_usernameController, Constants.usernamePlaceholder,
              const EdgeInsets.fromLTRB(0, 30, 0, 15), false, null),
          FormTextField(_emailController, Constants.emailPlaceholder,
              const EdgeInsets.fromLTRB(0, 10, 0, 15), false, null),
          FormTextField(_passwordController, Constants.passwordPlaceholder,
              const EdgeInsets.fromLTRB(0, 5, 0, 40), true, null),
          ButtonFormField(const EdgeInsets.fromLTRB(0, 10, 0, 0), _registerUser,
              Constants.registrationTitle, Colors.white, Colors.blue),
          CustomTextButton(
              Constants.loginButtonPlaceholder,
              Constants.loginTitle,
              const EdgeInsets.fromLTRB(0, 10, 0, 0),
              Colors.white,
              _navigateLoginUser)
        ]),
      ),
    );
  }

  void _navigateLoginUser() {
    Navigator.pop(_buildContext);
  }
}
