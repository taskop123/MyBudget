import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:my_budget_application/util/constants.dart';

import '../receipt/receipt_form.dart';

/// Screen used for displaying the captured picture using the user's device camera.
class DisplayPictureScreen extends StatefulWidget {
  /// The route name of the display image screen.
  static const routeName = Constants.displayImageRoute;

  /// Defines the image that is captured by the user's device camera.
  final XFile image;

  /// Constructor for the [DisplayPictureScreen] screen.
  const DisplayPictureScreen({Key? key, required this.image}) : super(key: key);

  /// Creating the state of the widget.
  @override
  State<StatefulWidget> createState() => _DisplayPictureScreenState();
}

/// State class for [DisplayPictureScreen].
class _DisplayPictureScreenState extends State<DisplayPictureScreen> {

  /// This method is called whenever the user makes an capture with the camera.
  ///
  /// It reads all of the content from the [image] that the used captures with his camera.
  /// The [image] is expected to be an receipt image where the content from the receipt
  /// are scanned using the [FlutterTesseractOcr] object.
  recognizeTextFromReceipt(File image) async {
    String _response =
        await FlutterTesseractOcr.extractText(image.path, language: 'mkd');

    Navigator.of(context)
        .pushNamed(ReceiptFormScreen.routeName, arguments: _response);
  }

  /// Method which is called when state is firstly initialized.
  @override
  initState(){
    super.initState();

    recognizeTextFromReceipt(File(widget.image.path));
  }

  /// Builds the UI elements for the addition of a new receipt processing screen,
  /// including the [body] with a [CircularProgressIndicator] while the text
  /// is processed using the [FlutterTesseractOcr] object.
  ///
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              SizedBox(
                height: 20,
              ),
              Text("Processing Receipt")
            ],
          )),
    );
  }
}
