import 'package:flutter/material.dart';

Container welcomeScreen() {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  'Dobrodošli u Oglasnik',
                  style: TextStyle(fontSize: 22),
                ),
                alignment: Alignment.centerLeft,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
