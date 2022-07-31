import 'dart:io';

import 'package:root_package/core/exceptions/file_upload_exception.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/firebase_storage.dart';
import 'package:root_package/root_package.dart';

class Utils {
  static Future<Either<UploadFileException, String>> uploadFile(
      File file, String path) async {
    final _firebaseStorage = FirebaseStorage.instance;

    try {
      final ref = _firebaseStorage.ref(path);
      final task = await ref.putFile(file);
      final url = await task.ref.getDownloadURL();
      return Right(url);
    } catch (e) {
      return Left(UploadFileException());
    }
  }
}

