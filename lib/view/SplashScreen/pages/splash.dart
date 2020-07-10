import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/SplashScreen/widgets/splashContainer.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
            FirebaseAuth.instance.currentUser() != null
                ? MaterialPageRoute(
                    builder: (BuildContext context) => AnonymouseHome())
                : MaterialPageRoute(
                    builder: (BuildContext context) => RegisteredHome())));
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 11, 48),
      body: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        child: SplashContainer(),
      ),
    );
  }
}
