import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:my_budget_application/widget/help/help_page_button.dart';
import 'package:my_budget_application/widget/help/help_view_page.dart';

import '../../util/constants.dart';

class HelpScreen extends StatelessWidget {
  static const routeName = Constants.helpRoute;

  const HelpScreen({Key? key}) : super(key: key);

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
