import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/SplashScreen/widgets/splashContainer.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Oglasnik/utils/colorThemes.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    /*
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
            FirebaseAuth.instance.currentUser() != null
                ? MaterialPageRoute(
                    builder: (BuildContext context) => AnonymouseHome())
                : MaterialPageRoute(
                    builder: (BuildContext context) => RegisteredHome()))); */

    Timer(Duration(seconds: 3), () => anonReg());

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

Future<void> anonReg() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  print(email);
  runApp(MaterialApp(
      theme: buildThemeData(),
      home: email == null ? AnonymouseHome() : RegisteredHome()));
}
