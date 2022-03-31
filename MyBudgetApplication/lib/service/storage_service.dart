import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  static final _firebaseStorage = FirebaseStorage.instance;

  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = _firebaseStorage.ref(destination);
      return ref.putFile(file);
    } on FirebaseException {
      return null;
    }
  }
}
