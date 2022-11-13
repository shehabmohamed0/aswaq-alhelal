import 'dart:io';

import 'package:path_provider/path_provider.dart';

// const appFolder = 'FluxBuilder/';
const appFolder = 'AswaqAlhelal/';

class LocalStorageKey {
  /// FLUXBUILDER
  static const String app = 'fstore';
  static const String notification = '${appFolder}notification';
}

class FileHelper {
  static Future<String> createAppFolder() async {
    if (appFolder.isEmpty) {
      return '';
    }
    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocDirFolder = Directory('${appDocDir.path}/$appFolder');

    if (await appDocDirFolder.exists()) {
      //if folder already exists return path
      return appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final appDocDirNewFolder = await appDocDirFolder.create(recursive: true);
      return appDocDirNewFolder.path;
    }
  }
}
