import 'package:flutter/material.dart';

ThemeData buildThemeData() {
    return ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Color.fromARGB(255, 226, 11, 48),
          buttonTheme: ButtonThemeData(
            height: 48,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: Color.fromARGB(255, 226, 11, 48),
                style: BorderStyle.solid,
              ),
            ),
          ),
          appBarTheme: buildAppBarTheme(),
          textTheme: ThemeData.light()
              .textTheme
              .copyWith(headline6: TextStyle(fontFamily: 'Roboto')));
  }

  AppBarTheme buildAppBarTheme() {
    return AppBarTheme(
            color: Color.fromARGB(255, 226, 11, 48),
            elevation: 0.0,
            textTheme: TextTheme(
              headline6: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Roboto',
              ),
            ),
          );
  }