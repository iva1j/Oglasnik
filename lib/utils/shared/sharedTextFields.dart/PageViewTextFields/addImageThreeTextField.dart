import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';

class AddImageThree extends StatelessWidget {
  const AddImageThree({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Text(
        img3,
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
