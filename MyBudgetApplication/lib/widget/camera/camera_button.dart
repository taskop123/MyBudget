import 'package:flutter/material.dart';

/// Widget which implements the button and its behaviour when the button is clicked
class CameraButton extends StatelessWidget {
  /// The build context in which this widget is called from.
  final BuildContext _parentBuildContext;
  /// The function that needs to be called when the button is clicked.
  final Function(BuildContext) _captureImageFunction;

  /// Defines a CameraButton widget with the corresponding
  /// BuildContext and Callback Function.
  const CameraButton(this._captureImageFunction, this._parentBuildContext, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: const Color(0xAA333639),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                iconSize: 40,
                onPressed: () => _captureImageFunction(_parentBuildContext),
                icon: const Icon(Icons.camera_alt, color: Colors.white),
              )
            ]),
      ),
    );
  }
}
