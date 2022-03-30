import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DisplayPictureScreen extends StatelessWidget {
  static const routeName = 'displayImage';
  final XFile image;
  const DisplayPictureScreen({Key? key, required this.image}) : super(key: key);

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
