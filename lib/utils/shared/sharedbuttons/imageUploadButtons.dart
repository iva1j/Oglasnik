import 'package:Oglasnik/utils/shared/sharedTextFields.dart/pageViewTextFields.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:flutter/material.dart';

Container imageOneUploadButton(dynamic function) {
  buttonOne = true;
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 35.0),
    child: FlatButton.icon(
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
      label: AddImageOne(),
      onPressed: function,
    ),
  );
}

//buttons for image upload located in imagePageWidget
Container imageTwoUploadButton(dynamic function) {
  buttonTwo = true;
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 35.0),
    child: FlatButton.icon(
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
      onPressed: function,
    ),
  );
}

//buttons for image upload located in imagePageWidget
Container imageThreeUploadButton(dynamic function) {
  buttonThree = true;
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 35.0),
    child: FlatButton.icon(
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
      onPressed: function,
    ),
  );
}
