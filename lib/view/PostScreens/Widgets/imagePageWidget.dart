/*import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/text_form_fields.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageViewButton.dart';
import 'package:flutter/material.dart';

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
  
  File sampleImage;


  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = tempImage;
    });
  }


  Future pickImage() async {
    //for (int i = 0; i < 100; i++) print(sampleImage.toString() + '$i');
    File tempImage =
        await ImagePicker().getImage(source: ImageSource.gallery) as File;

    setState(() {
      sampleImage = tempImage;
    });
  }
*/
/*
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottom),
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
/*
              margin: EdgeInsets.only(bottom: 80.0),
            ),
            imageOneUploadButton(() {}),

            sampleImage == null
                ? Text("Select an image")
                : enableUpload(), //dodati funkcije
*/
              margin: EdgeInsets.only(bottom: 80.0),
              //  child: MainTitle()
            ),
            imageOneUploadButton(() {}), //dodati funkcije

            imageTwoUploadButton(() {}),
            imageThreeUploadButton(() {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 35.0, bottom: 30.0),
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
*/
/*
  Widget enableUpload() {
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 5,
        bottom: SizeConfig.blockSizeVertical * 5,
      ),
      child: Column(
        children: <Widget>[
          Image.file(
            sampleImage,
            height: 10.0,
            width: 10.0,
          ),
          RaisedButton(
            color: Colors.black,
            elevation: 0,
            child: Text("Upload"),
            onPressed: () {
              /*
              final StorageReference firebaseStorageRef =
                  FirebaseStorage.instance.ref().child('images/');
              final StorageUploadTask task =
                  firebaseStorageRef.putFile(sampleImage);*/
            },
          ),
        ],
      ),
    );
  }
  */

import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/text_form_fields.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
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
  File _image;
  String _basename = '';

  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = new File(pickedFile.path);
      _basename = pickedFile.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottom),
      child: Container(
        height: SizeConfig.screenHeight,
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 80.0), child: MainTitle()),
            imageOneUploadButton(getImage),
            imageTwoUploadButton(() {}),
            imageThreeUploadButton(() {}),
            _basename == '' ? Container() : Text(_basename),
            CircleAvatar(
              backgroundImage: _image != null
                  ? FileImage(_image)
                  : null, // mora samo biti url i na textu
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 35.0, bottom: 30.0),
                    child: priceTextField()),
                Padding(
                    padding: EdgeInsets.only(left: 7),
                    child: Text(MoneyText().kmText)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
