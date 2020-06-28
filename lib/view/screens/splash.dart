import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/screens/AnonymousHome/anonymousHome.dart';
import 'package:Oglasnik/view/widgets/logoContainer.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 11, 48),
      body: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        child: Column(
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
        ),
      ),
    );
  }
}
