import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/PageViewTextFields/addImageTwoTextField.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';

//buttons for image upload located in imagePageWidget
Container imageTwoUploadButton(dynamic function, dynamic functionDelete) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
    child: Row(
      children: <Widget>[
        img2 != immutableImg2
            ? IconButton(
                icon: Icon(
                  Icons.delete,
                ),
                onPressed: functionDelete)
            : image2Name == null
                ? IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.transparent,
                    ),
                    onPressed: null)
                : IconButton(
                    icon: Icon(
                      Icons.delete,
                    ),
                    onPressed: functionDelete),
        FlatButton.icon(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: Colors.white,
                style: BorderStyle.solid,
              ),
            ),
            icon: Icon(
              Icons.add_circle,
              color: Colors.black,
              size: 25,
            ),
            label: AddImageTwo(),
            onPressed:
                img1 != immutableImg1 || image1Name != null ? function : null),
      ],
    ),
  );
}
