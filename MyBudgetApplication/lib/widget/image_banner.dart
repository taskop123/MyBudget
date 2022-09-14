import 'package:flutter/cupertino.dart';

/// Defines the image banned widget that displays the logo of
/// our application on the main screen.
class ImageBanner extends StatelessWidget {
  /// Defines the image url that needs to be displayed.
  final String _imageUrl;

  /// Creates new [ImageBanner] widget with the given [_imageUrl].
  const ImageBanner(this._imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Image.asset(
        _imageUrl,
        height: 120,
        width: 200,
        fit: BoxFit.contain,
      ),
    );
  }
}
