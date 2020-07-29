import 'package:Oglasnik/utils/shared/sharedTextFields.dart/PageViewTextFields/addImageOneTextField.dart';
import 'package:flutter/material.dart';

Container imageOneUploadButton(dynamic function) {
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
