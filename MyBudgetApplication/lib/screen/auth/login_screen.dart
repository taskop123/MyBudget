import 'package:flutter/material.dart';
import 'package:my_budget_application/screen/auth/registration_screen.dart';
import 'package:my_budget_application/util/validation_utils.dart';
import 'package:my_budget_application/widget/form/button_form_field.dart';
import 'package:my_budget_application/widget/form/button_icon_form_field.dart';
import 'package:my_budget_application/widget/form/form_field.dart';
import 'package:my_budget_application/widget/form/text_form_field.dart';
import 'package:my_budget_application/widget/text_button.dart';
import 'package:provider/provider.dart';

import '../../service/firebase/authentication_service.dart';
import '../../util/constants.dart';
import '../../widget/image_banner.dart';

/// Screen used for user authentication.
class LoginScreen extends StatefulWidget {
  /// The route name of the login screen.
  static const routeName = Constants.loginRoute;

  /// The function that has the required business logic
  /// to authenticate a user and redirect to another screen if needed.
  final Function()? _loginFunction;

  /// Creates an instance of the [LoginScreen] with a [_loginFunction].
  const LoginScreen(this._loginFunction, {Key? key}) : super(key: key);

  /// Creates the state object for the [LoginScreen].
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

/// State class used to display the authentication logic for users.
class _LoginScreenState extends State<LoginScreen> {
  /// The build context of the state class for [LoginScreen].
  late BuildContext _buildContext;

  /// Keeps the state of the form throughout the authentication screen.
  final _formKey = GlobalKey<FormState>();

  /// Keeps the state of the email value,
  /// written in the adequate text form field.
  final TextEditingController _emailController = TextEditingController();

  /// Keeps the state of the password value,
  /// which was inputted in the adequate text form field.
  final TextEditingController _passwordController = TextEditingController();

  /// Makes a check whether the [email] and [password],
  /// that have been inputted from the user in the adequate form fields,
  /// are valid and in the correct format.
  ///
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

  /// Used for the authentication of the user,
  /// validating the user credentials,
  /// and making a redirect if everything is successful.
  ///
  /// If the validation is not successful, the login and redirect is not made.
  /// If the login to the [FirebaseAuth] service was not successful,
  /// the adequate error message is displayed.
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

  void _loginUserGoogle() async {
    String result =
        await _buildContext.read<AuthenticationService>().loginWithGoogle();
    ScaffoldMessenger.of(_buildContext).showSnackBar(SnackBar(
      content: Text(result.toString()),
      duration: const Duration(seconds: 3),
    ));
    widget._loginFunction!();
  }

  void _loginUserFacebook() async {
    // String result =
    //     await _buildContext.read<AuthenticationService>().loginWithFacebook();
    // ScaffoldMessenger.of(_buildContext).showSnackBar(SnackBar(
    //   content: Text(result.toString()),
    //   duration: const Duration(seconds: 3),
    // ));
    // widget._loginFunction!();
  }

  /// Builds the UI elements for the authentication screen,
  /// including the [appBar] and [body] with a [context],
  /// with the adequate form elements.
  ///
  @override
  Widget build(BuildContext context) {
    _buildContext = context;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.loginTitle),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 30),
        child: FormControl(_formKey, [
          const ImageBanner(Constants.logoUrl),
          FormTextField(_emailController, Constants.emailPlaceholder,
              const EdgeInsets.fromLTRB(0, 40, 0, 15), false, null),
          FormTextField(_passwordController, Constants.passwordPlaceholder,
              const EdgeInsets.fromLTRB(0, 10, 0, 30), true, null),
          ButtonFormField(const EdgeInsets.fromLTRB(0, 10, 0, 0), _loginUser,
              Constants.loginTitle, Colors.white, Colors.blueGrey),
          CustomTextButton(
            Constants.registerButtonPlaceholder,
            Constants.registrationTitle,
            const EdgeInsets.fromLTRB(0, 10, 0, 0),
            Colors.white,
            _navigateRegisterUser,
          ),
          Row(
            children: [
              ButtonIconFormField(
                  const EdgeInsets.fromLTRB(0, 20, 20, 0),
                  _loginUserGoogle,
                  Image.asset(
                    Constants.googleLogoUrl,
                    height: 25,
                    width: 40,
                  ),
                  Colors.white),
              ButtonIconFormField(
                  const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  _loginUserFacebook,
                  Image.asset(
                    Constants.facebookLogoUrl,
                    height: 38,
                    width: 45,
                  ),
                  Colors.white),
            ],
          ),
        ]),
      ),
    );
  }

  /// Navigates the user from the [LoginScreen] to the [RegistrationScreen].
  void _navigateRegisterUser() {
    Navigator.of(_buildContext).pushNamed(RegistrationScreen.routeName);
  }
}
