import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../exceptions/file_upload_exception.dart';

class Utils {
  static Future<Either<UploadFileException, String>> uploadFile(
      File file, String path) async {
    final firebaseStorage = FirebaseStorage.instance;

    try {
      final ref = firebaseStorage.ref(path);
      final task = await ref.putFile(file);
      final url = await task.ref.getDownloadURL();
      return Right(url);
    } catch (e) {
      return Left(UploadFileException());
    }
  }
}
