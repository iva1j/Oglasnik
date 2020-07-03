import 'package:Oglasnik/utils/shared/logoContainer.dart';
import 'package:flutter/material.dart';

class SplashContainer extends StatelessWidget {
  const SplashContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 100),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(60, 255, 255, 255),
                ),
                width: 110,
                height: 113,
              ),
              SplashLogo(),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 180),
          child: Text(
            'OGLASNIK',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
