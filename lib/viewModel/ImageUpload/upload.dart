import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<String> upload(fileName, filePath, id) async {
  StorageReference storageRef =
      FirebaseStorage.instance.ref().child('images').child(fileName);
  final lastIndex = filePath.lastIndexOf(new RegExp(r'.jp'));
  final splitted = filePath.substring(0, (lastIndex));
  final outPath = "${splitted}_out${filePath.substring(lastIndex)}";

  final compressedImage = await FlutterImageCompress.compressAndGetFile(
      filePath, outPath,
      minWidth: 1000, minHeight: 1000, quality: 70);
  final StorageUploadTask task = storageRef.putFile(
    compressedImage,
  );
  return await (await task.onComplete).ref.getDownloadURL();
}
