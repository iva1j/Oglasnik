import 'package:flutter/material.dart';

SizedBox button(String text, dynamic function) {
  return SizedBox(
    height: 48,
    width: 250,
    child: RaisedButton(
      elevation: 0,
      onPressed: function,
      color: Color.fromARGB(255, 226, 11, 48),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Roboto',
          fontSize: 14,
        ),
      ),
    ),
  );
}
