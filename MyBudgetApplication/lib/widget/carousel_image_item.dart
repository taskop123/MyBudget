import 'package:flutter/cupertino.dart';

class CarouselImageItem extends StatelessWidget {
  final String _imagePath;

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
