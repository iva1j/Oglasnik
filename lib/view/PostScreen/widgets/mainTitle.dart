import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              NewPostScreen().unosNaslov,
              style: TextStyle(fontFamily: "Roboto", fontSize: 20),
            ),
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }
}
