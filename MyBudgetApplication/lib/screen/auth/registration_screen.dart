import 'package:flutter/material.dart';
import 'package:my_budget_application/screen/auth/login_screen.dart';
import 'package:my_budget_application/util/constants.dart';
import 'package:my_budget_application/util/validation_utils.dart';
import 'package:my_budget_application/widget/form/button_form_field.dart';
import 'package:my_budget_application/widget/form/form_field.dart';
import 'package:my_budget_application/widget/form/text_form_field.dart';
import 'package:my_budget_application/widget/text_button.dart';
import 'package:provider/provider.dart';

import '../../service/firebase/authentication_service.dart';
import '../../widget/image_banner.dart';

/// Screen used for user registration.
class RegistrationScreen extends StatefulWidget {
  /// The route name of the registration screen.
  static const routeName = Constants.registerRoute;

  /// Creates an instance of the [RegistrationScreen].
  const RegistrationScreen({Key? key}) : super(key: key);

  /// Creates the state object for the [RegistrationScreen].
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

/// State class used to display the registration logic for users.
class _RegistrationScreenState extends State<RegistrationScreen> {
  /// The build context of the state class for [RegistrationScreen].
  late BuildContext _buildContext;

  /// Keeps the state of the form throughout the registration screen.
  final _formKey = GlobalKey<FormState>();

  /// Keeps the state of the username value,
  /// written in the adequate text form field.
  final TextEditingController _usernameController = TextEditingController();

  /// Keeps the state of the email value,
  /// written in the adequate text form field.
  final TextEditingController _emailController = TextEditingController();

  /// Keeps the state of the password value,
  /// written in the adequate text form field.
  final TextEditingController _passwordController = TextEditingController();

  /// Makes a check whether the [username], [password] and [email]
  /// that have been inputted from the user in the adequate form fields,
  /// are valid and in the correct format.
  ///
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

  /// Used for the registration of the user,
  /// validating the user credentials,
  /// and making a redirect to the if everything is successful.
  ///
  /// If the validation is not successful, the registration is not made.
  /// If the registration to the [FirebaseAuth] service was not successful,
  /// the adequate error message is displayed.
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

    _navigateLoginUser();
  }

  /// Builds the UI elements for the registration screen,
  /// including the [appBar] and [body] with a [context],
  /// with the adequate form elements.
  ///
  @override
  Widget build(BuildContext context) {
    _buildContext = context;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.registrationTitle),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 30),
          child: FormControl(_formKey, [
            const ImageBanner(Constants.logoUrl),
            FormTextField(_usernameController, Constants.usernamePlaceholder,
                const EdgeInsets.fromLTRB(0, 30, 0, 15), false, null),
            FormTextField(_emailController, Constants.emailPlaceholder,
                const EdgeInsets.fromLTRB(0, 10, 0, 15), false, null),
            FormTextField(_passwordController, Constants.passwordPlaceholder,
                const EdgeInsets.fromLTRB(0, 5, 0, 40), true, null),
            ButtonFormField(
                const EdgeInsets.fromLTRB(0, 10, 0, 0),
                _registerUser,
                Constants.registrationTitle,
                Colors.white,
                Colors.blueGrey),
            CustomTextButton(
              Constants.loginButtonPlaceholder,
              Constants.loginTitle,
              const EdgeInsets.fromLTRB(0, 10, 0, 0),
              Colors.blue,
              _navigateLoginUser,
            )
          ]),
        ),
      ),
    );
  }

  /// Navigates the user from the [RegistrationScreen] to the [LoginScreen].
  void _navigateLoginUser() {
    Navigator.pop(_buildContext);
  }
}
