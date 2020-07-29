import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

Future<String> upload(fileName, filePath, id) async {
  StorageReference storageRef =
      FirebaseStorage.instance.ref().child('images').child(fileName);
  final StorageUploadTask task = storageRef.putFile(
    File(filePath),
  );
  return await (await task.onComplete).ref.getDownloadURL();
}
