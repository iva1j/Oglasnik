import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/text_form_fields.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageViewButton.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';

class ImagePageWidget extends StatefulWidget {
  const ImagePageWidget({
    Key key,
    @required this.bottom,
  }) : super(key: key);

  final double bottom;

  @override
  _ImagePageWidgetState createState() => _ImagePageWidgetState();
}

class _ImagePageWidgetState extends State<ImagePageWidget> {
  String _path;
  String _extension;
  FileType _imageType = FileType.image;

  List<StorageUploadTask> _tasks = <StorageUploadTask>[];

  void openFileExplorer() async {
    _path = null;

    _path = await FilePicker.getFilePath(type: _imageType);

    uploadToFirebase();
  }

  uploadToFirebase() {
    String fileName = _path.split('/').last;
    String filePath = _path;
    upload(fileName, filePath);
  }

  upload(fileName, filePath) {
    _extension = fileName.toString().split('.').last;
    StorageReference storageRef =
        FirebaseStorage.instance.ref().child(fileName);
    final StorageUploadTask uploadTask = storageRef.putFile(
      File(filePath),
      StorageMetadata(
        contentType: '$_imageType/$_extension',
      ),
    );
    setState(() {
      _tasks.add(uploadTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];
    _tasks.forEach((StorageUploadTask task) {
      final Widget tile = UploadTaskListTile(
        task: task,
        onDismissed: () => setState(() => _tasks.remove(task)),
      );
      children.add(tile);
    });
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottom),
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            MainTitle(),
            Container(
              margin: EdgeInsets.only(bottom: 80.0),
            ),
            imageOneUploadButton(openFileExplorer), //dodati funkcije
            imageTwoUploadButton(openFileExplorer),
            imageThreeUploadButton(openFileExplorer),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 35.0, bottom: 32.0),
                    child: priceTextField()),
                Padding(
                    padding: EdgeInsets.only(left: 7),
                    child: Text(MoneyText().kmText)),
              ],
            ),
            Container(
              child: PageViewButton(),
            )
          ],
        ),
      ),
    );
  }
}

class UploadTaskListTile extends StatelessWidget {
  const UploadTaskListTile({Key key, this.task, this.onDismissed})
      : super(key: key);

  final StorageUploadTask task;
  final VoidCallback onDismissed;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StorageTaskEvent>(
      stream: task.events,
      builder: (BuildContext context,
          AsyncSnapshot<StorageTaskEvent> asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          final StorageTaskEvent event = asyncSnapshot.data;
          final StorageTaskSnapshot snapshot = event.snapshot;
        }
        return Dismissible(
          key: Key(task.hashCode.toString()),
          onDismissed: (_) => onDismissed(),
          child: ListTile(
            title: Text('Imagehashcode #${task.hashCode}'),
          ),
        );
      },
    );
  }
}
