import 'dart:io';
import 'dart:isolate';

import 'package:dartz/dartz.dart';
import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';

import '../../packages/image_cropper.dart';
import '../../packages/image_picker.dart';
import '../resources/color_manager.dart';

class ImageUtils {
  static Future<Option<File>> pickAndCompressImage(
    ImageSource source, {
    required int width,
    required int height,
    Interpolation interpolation = Interpolation.nearest,
  }) async {
    final imageXFile = await ImagePicker().pickImage(source: source);
    if (imageXFile == null) {
      return none();
    }
    final imageFile = File(imageXFile.path);
    final compressedImage =
        await compressImage(imageFile, width: width, height: height);

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: compressedImage.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: ColorManager.primary,
          toolbarWidgetColor: ColorManager.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioLockEnabled: true,
        ),
      ],
    );
    if (croppedFile == null) {
      return none();
    }

    final lastFile = File(croppedFile.path);
    return some(lastFile);
  }

  static Future<File> compressImage(File f,
      {required int width,
      required int height,
      Interpolation interpolation = Interpolation.nearest}) async {
    ReceivePort receivePort = ReceivePort();
    final isolate = await Isolate.spawn(
      _getCompressedImage,
      receivePort.sendPort,
    );
    SendPort sendPort = await receivePort.first;
    ReceivePort receivePort2 = ReceivePort();
    sendPort.send([
      f.path,
      f.uri.pathSegments.last,
      (await getTemporaryDirectory()).path,
      receivePort2.sendPort,
      width,
      height,
      interpolation,
    ]);
    var msg = await receivePort2.first;

    isolate.kill();
    return File(msg);
  }

  static Future<void> _getCompressedImage(SendPort sendPort) async {
    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    List msg = (await receivePort.first) as List;
    String srcPath = msg[0];
    String name = msg[1];
    String destDirPath = msg[2];
    SendPort replyPort = msg[3];
    int width = msg[4];
    int height = msg[5];
    Interpolation interpolation = msg[6];
    final imagefile = File(srcPath);
    print(imagefile.path);
    Image image = decodeImage(await imagefile.readAsBytes())!;

    if (image.width > width || image.height > height) {
      image = copyResize(image,
          height: height, width: width, interpolation: interpolation);
    }
    File destFile = File(destDirPath + '/' + name);
    await destFile.writeAsBytes(encodeNamedImage(image, name)!);
    replyPort.send(destFile.path);
  }
}
