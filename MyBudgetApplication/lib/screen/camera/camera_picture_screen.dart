import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/util/constants.dart';

/// Screen used for displaying the captured picture using the user's device camera.
class DisplayPictureScreen extends StatelessWidget {
  /// The route name of the display image screen.
  static const routeName = Constants.displayImageRoute;

  /// Defines the image that is captured by the user's device camera.
  final XFile image;

  /// Creates new display picture screen with the [image] property.
  const DisplayPictureScreen({Key? key, required this.image}) : super(key: key);

  /// Builds the UI elements for displaying the captured image, 
  /// including the [appBar] and [body] with a [context],
  /// with the image displaying elements.
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.displayImageTitle),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.file(
          File(image.path),
          fit: BoxFit.fill,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var count = 0;
          Navigator.popUntil(context, (route) {
            return count++ == 2;
          });
        },
        child: const Icon(Icons.send),
      ),
    );
  }
}
