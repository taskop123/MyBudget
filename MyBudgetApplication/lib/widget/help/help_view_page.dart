import 'package:flutter/cupertino.dart';
import 'package:introduction_screen/introduction_screen.dart';

/// Defines the help view screen widget for displaying information about
/// how to use our application.
class HelpViewPage extends PageView {
  /// Defines the title of the screen.
  final String _title;

  /// Defines the body text content that is going to be displayed in the screen.
  final String _body;

  /// Defines the image path that is going to be displayed in the screen.
  final String _imagePath;

  /// Creates new help view page screen with the given [_title], [_body]
  /// and the specified [_imagePath].
  HelpViewPage(this._title, this._body, this._imagePath, {Key? key})
      : super(key: key);

  /// Displays the image with the given [path].
  Widget buildImage(String path) => Center(
        child: Image.asset(
          path,
          width: 240,
        ),
      );

  /// Defines the page decoration.
  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle:
            const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyTextStyle: const TextStyle(fontSize: 18),
        bodyPadding: const EdgeInsets.all(20).copyWith(bottom: 0),
        imagePadding: const EdgeInsets.all(24),
      );

  /// Returns the PageViewModel with the given title, description
  /// and an image with the page decoration.
  PageViewModel get() {
    return PageViewModel(
      title: _title,
      body: _body,
      image: buildImage(_imagePath),
      decoration: getPageDecoration(),
    );
  }
}
