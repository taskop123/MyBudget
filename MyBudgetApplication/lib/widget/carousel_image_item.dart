import 'package:flutter/cupertino.dart';

/// Defines the image item to be displayed on the carousel widget.
class CarouselImageItem extends StatelessWidget {
  /// The path of the image to be displayed.
  final String _imagePath;

  /// Creates a new instance of the [CarouselImageItem]
  /// with the given [_imagePath].
  const CarouselImageItem(this._imagePath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: AssetImage(_imagePath),
            fit: BoxFit.cover,
          )),
    );
  }
}
