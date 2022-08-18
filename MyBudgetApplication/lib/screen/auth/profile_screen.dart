import 'package:flutter/material.dart';
import 'package:my_budget_application/model/expense.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/widget/profile/profile_top_widget.dart';

import '../../util/constants.dart';
import '../../widget/profile/profile_content.dart';

/// Screen used for the profile details of the currently authenticated user.
class ProfileScreen extends StatefulWidget {
  /// The route name of the profile screen.
  static const routeName = Constants.profileRoute;

  /// Creates an instance of the [ProfileScreen].
  const ProfileScreen({Key? key}) : super(key: key);

  /// Creates the state object for the [ProfileScreen].
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  /// The list of the expenses the currently logged in user has.
  List<Expense>? _expenses;

  /// The height of the cover picture in the screen in logical pixels.
  final double coverHeight = 140;

  /// The height of the profile picture in the screen in logical pixels.
  final double profileHeight = 200;

  /// Builds the UI elements for the profile screen,
  /// including the [appBar] and [body] with a [context],
  /// with the adequate cover and profile picture widgets,
  /// and the content widgets with the current [CustomUser] statistics.
  ///
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as List;
    var currentUser = arguments[0] as CustomUser;
    List<Expense> expenses = arguments[1] as List<Expense>;
    _expenses = expenses;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.profileTitle),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ProfileTopWidget(currentUser, coverHeight, profileHeight),
          ProfileContentWidget(currentUser, _expenses!),
        ],
      ),
    );
  }
}
