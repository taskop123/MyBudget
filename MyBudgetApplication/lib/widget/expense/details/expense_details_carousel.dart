import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import '../../../util/constants.dart';
import '../../carousel_image_item.dart';

/// Defines the carousel widget from which
/// the details expense screen consists of.
class ExpenseDetailsCarousel extends StatelessWidget {
  /// Creates an instance of the [ExpenseDetailsCarousel] widget object.
  const ExpenseDetailsCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 230,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 500),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: const [
        CarouselImageItem(Constants.carouselItemOneImage),
        CarouselImageItem(Constants.carouselItemTwoImage),
        CarouselImageItem(Constants.carouselItemThreeImage),
      ],
    );
  }
}
