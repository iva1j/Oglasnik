import 'dart:io';

import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/text_form_fields.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  File _imageFile;

  Future<void> pickImage(ImageSource source) async {
    File selected = ImagePicker().getImage(source: ImageSource.gallery) as File;

    setState(() {
      _imageFile = selected;
    });
  }

  void _clear() {
    setState(() => _imageFile = null);
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
            imageOneUploadButton(
                () => pickImage(ImageSource.gallery)), //dodati funkcije
            imageTwoUploadButton(() => pickImage(ImageSource.gallery)),
            imageThreeUploadButton(() => pickImage(ImageSource.gallery)),
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

            // Container(
            //     margin: EdgeInsets.only(top: 100.0),
            //     child: button('Završi', () async {})),
          ],
        ),
      ),
    );
  }
}
