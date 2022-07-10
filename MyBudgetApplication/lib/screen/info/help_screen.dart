import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:my_budget_application/widget/help/help_page_button.dart';
import 'package:my_budget_application/widget/help/help_view_page.dart';

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
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            HelpViewPage(Constants.stepOneTitle, Constants.stepOneBody,
                    Constants.stepOneImage)
                .get(),
            HelpViewPage(Constants.stepTwoTitle, Constants.stepTwoBody,
                    Constants.stepTwoImage)
                .get(),
            HelpViewPage(Constants.stepThreeTitle, Constants.stepThreeBody,
                    Constants.stepThreeImage)
                .get(),
            HelpViewPage(Constants.stepFourTitle, Constants.stepFourBody,
                    Constants.stepFourImage)
                .get(),
            HelpViewPage(Constants.stepFiveTitle, Constants.stepFiveBody,
                    Constants.stepFiveImage)
                .get(),
          ],
          done: const HelpPageButton(Constants.finishButton),
          onDone: () => _navigateOut(context),
          showBackButton: true,
          showNextButton: true,
          back: const HelpPageButton(Constants.backButton),
          next: const HelpPageButton(Constants.nextButton),
        ),
      ),
    );
  }

  void _navigateOut(BuildContext buildContext) {
    Navigator.pop(buildContext);
  }
}
