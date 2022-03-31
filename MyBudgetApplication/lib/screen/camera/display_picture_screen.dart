import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class DisplayPictureScreen extends StatelessWidget {
  static const routeName = 'displayImage';
  final XFile image;

  const DisplayPictureScreen({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Image'),
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
