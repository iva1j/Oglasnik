import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';

class AddImageOne extends StatelessWidget {
  const AddImageOne({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      img1,
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}