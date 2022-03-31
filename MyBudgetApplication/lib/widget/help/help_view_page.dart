import 'package:flutter/cupertino.dart';
import 'package:introduction_screen/introduction_screen.dart';

class HelpViewPage extends PageView {
  final String _title;
  final String _body;
  final String _imagePath;

  HelpViewPage(this._title, this._body, this._imagePath, {Key? key})
      : super(key: key);

  Widget buildImage(String path) => Center(
        child: Image.asset(
          path,
          width: 240,
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle:
            const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyTextStyle: const TextStyle(fontSize: 18),
        bodyPadding: const EdgeInsets.all(20).copyWith(bottom: 0),
        imagePadding: const EdgeInsets.all(24),
      );

  PageViewModel get() {
    return PageViewModel(
      title: _title,
      body: _body,
      image: buildImage(_imagePath),
      decoration: getPageDecoration(),
    );
  }
}
