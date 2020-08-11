import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/PageViewTextFields/addImageThreeTextField.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';

//buttons for image upload located in imagePageWidget
Container imageThreeUploadButton(dynamic function, dynamic functionDelete) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
    child: Row(
      children: <Widget>[
        IconButton(
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
          label: AddImageThree(),
          onPressed:
              img2 != immutableImg2 || image2Name != null ? function : null,
        ),
      ],
    ),
  );
}
