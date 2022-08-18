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

  // TODO: Implement the logic for processing the image, receiving the data, and storing it in the firebase data storage, which is already connected for saving profile pictures.
  // upload(XFile imageFile) async {
  //   // open a bytestream
  //   var stream =
  //       // ignore: deprecated_member_use
  //       http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  //   // get file length
  //   var length = await imageFile.length();
  //
  //   var URL =
  //       "https://my-budget.cognitiveservices.azure.com/formrecognizer/documentModels/prebuilt-receipt:analyze?api-version=2021-09-30-preview";
  //
  //   // string to uri
  //   var uri = Uri.parse(URL);
  //
  //   // create multipart request
  //   var request = http.MultipartRequest("POST", uri);
  //
  //   Map<String, String> headers = {
  //     "Content-Type": "image/jpeg",
  //     "Ocp-Apim-Subscription-Key": "8d5f13f0892848dc879e2c6b3908bb4c"
  //   };
  //
  //   request.headers.addAll(headers);
  //
  //   // multipart that takes file
  //   var multipartFile = http.MultipartFile('image.jpeg', stream, length,
  //       filename: basename(imageFile.path));
  //
  //   // add file to multipart
  //   request.files.add(multipartFile);
  //
  //   // send
  //   var response = await request.send();
  //   print(response.statusCode);
  //
  //   // listen for response
  //   response.stream.transform(utf8.decoder).listen((value) {
  //     print(value);
  //   });
  // }

  /// Builds the UI elements for displaying the captured image, 
  /// including the [floatingActionButton] and [body] with a [context],
  /// with the image displaying elements.
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
