import 'package:flutter/cupertino.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../util/constants.dart';
import 'help_page_button.dart';
import 'help_view_page.dart';

/// Defines the carousel of the help view widget screen.
class HelpViewCarousel extends StatelessWidget {
  /// Defines the function to be called after exiting the help view screen.
  final Function(BuildContext) _navigateOut;

  /// Creates a new instance of the [HelpViewCarousel] object,
  /// with the specified [_navigateOut] function.
  const HelpViewCarousel(this._navigateOut, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}
