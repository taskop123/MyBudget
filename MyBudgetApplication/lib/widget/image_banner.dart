import 'package:flutter/cupertino.dart';

class ImageBanner extends StatelessWidget {
  final String _imageUrl;

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