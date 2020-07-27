import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';

class AddImageTwo extends StatelessWidget {
  const AddImageTwo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Text(
        img2,
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
