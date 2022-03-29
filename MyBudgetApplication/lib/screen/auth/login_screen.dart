import 'package:flutter/material.dart';
import 'package:my_budget_application/screen/auth/registration_screen.dart';
import 'package:my_budget_application/util/validation_utils.dart';
import 'package:my_budget_application/widget/form/button_form_field.dart';
import 'package:my_budget_application/widget/form/form_field.dart';
import 'package:my_budget_application/widget/form/text_form_field.dart';
import 'package:my_budget_application/widget/text_button.dart';
import 'package:provider/provider.dart';

import '../../service/firebase/authentication_service.dart';
import '../../util/constants.dart';
import '../../widget/image_banner.dart';
import '../../widget/menu/popup_menu.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = Constants.loginRoute;

  final Function()? _loginFunction;

  const LoginScreen(this._loginFunction, {Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late BuildContext _buildContext;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _validateInput(String? email, String? password) {
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

  void _loginUser() async {
    var email = _emailController.text;
    var password = _passwordController.text;

    if (!_validateInput(email, password)) {
      return;
    }
    String result = await _buildContext
        .read<AuthenticationService>()
        .login(email: email, password: password);
    ScaffoldMessenger.of(_buildContext).showSnackBar(SnackBar(
      content: Text(result.toString()),
      duration: const Duration(seconds: 3),
    ));

    widget._loginFunction!();
  }

  @override
  Widget build(BuildContext context) {
    _buildContext = context;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.loginTitle),
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
          FormTextField(_emailController, Constants.emailPlaceholder,
              const EdgeInsets.fromLTRB(0, 40, 0, 15), false, null),
          FormTextField(_passwordController, Constants.passwordPlaceholder,
              const EdgeInsets.fromLTRB(0, 10, 0, 40), true, null),
          ButtonFormField(const EdgeInsets.fromLTRB(0, 10, 0, 0), _loginUser,
              Constants.loginTitle, Colors.white, Colors.blue),
          CustomTextButton(
              Constants.registerButtonPlaceholder,
              Constants.registrationTitle,
              const EdgeInsets.fromLTRB(0, 10, 0, 0),
              Colors.white,
              _navigateRegisterUser),
        ]),
      ),
    );
  }

  void _navigateRegisterUser() {
    Navigator.of(_buildContext).pushNamed(RegistrationScreen.routeName);
  }
}
