import 'package:flutter/material.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
