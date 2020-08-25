import 'package:Oglasnik/utils/shared/PageLogos/splashLogo.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 180),
              child: FadeAnimatedTextKit(
                onTap: () {
                  print("Tap Event");
                },
                text: [
                  "Pronađi nešto za sebe",
                ],
                duration: Duration(milliseconds: 1500),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
