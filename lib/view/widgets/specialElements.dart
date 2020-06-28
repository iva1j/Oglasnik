import 'package:flutter/material.dart';

SizedBox button(String text, dynamic function) {
  return SizedBox(
    height: 50,
    width: 250,
    child: RaisedButton(
      elevation: 3,
      onPressed: function,
      color: Color.fromARGB(255, 226, 11, 48),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Roboto', //#TODO  postaviti ROBOTO medium
          fontSize: 14,
        ),
      ),
    ),
  );
}

SizedBox buttons(String text, dynamic function) {
  return SizedBox(
    height: 50,
    width: 250,
    child: RaisedButton(
      elevation: 0,
      onPressed: function,
      color: Color.fromARGB(255, 225, 255, 255),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Roboto', //#TODO  postaviti ROBOTO medium
          fontSize: 14,
        ),
      ),
    ),
  );
}

IconButton backButtonIphone(BuildContext context) {
    return IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          });
  }