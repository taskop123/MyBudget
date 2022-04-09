import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

/// Service used for the [FirebaseStorage].
class StorageService {
  /// The reference to the [FirebaseStorage].
  static final _firebaseStorage = FirebaseStorage.instance;

  /// Creates and uploads a new file to the [FirebaseStorage],
  /// given the specific [file] and [destination].
  ///
  /// Returns null, if the upload was not sucesful.
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = _firebaseStorage.ref(destination);
      return ref.putFile(file);
    } on FirebaseException {
      return null;
    }
  }
}
