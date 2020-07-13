import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/text_form_fields.dart';
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
              margin: EdgeInsets.only(bottom: 80.0),
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
          ],
        ),
      ),
    );
  }
}
