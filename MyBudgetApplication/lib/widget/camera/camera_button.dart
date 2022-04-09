import 'package:flutter/material.dart';

class CameraButton extends StatelessWidget {
  final BuildContext _parentBuildContext;
  final Function(BuildContext) _captureImageFunction;

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
