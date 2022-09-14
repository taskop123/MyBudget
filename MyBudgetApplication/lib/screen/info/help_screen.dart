import 'package:flutter/material.dart';
import 'package:my_budget_application/widget/help/help_view_carousel.dart';

import '../../util/constants.dart';

/// The help screen which shows guide to using the application.
class HelpScreen extends StatelessWidget {
  /// The route name of the help screen.
  static const routeName = Constants.helpRoute;

  /// Creates an instance of the [HelpScreen].
  const HelpScreen({Key? key}) : super(key: key);

  /// Builds the UI elements for the help screen,
  /// including the [appBar] and a [body]
  /// with a [context] of the adequate help pages with content.
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.helpTitle),
      ),
      body: HelpViewCarousel(_navigateOut),
    );
  }

  /// Navigates the user from the [HelpScreen] back to the main home screen.
  void _navigateOut(BuildContext buildContext) {
    Navigator.pop(buildContext);
  }
}
