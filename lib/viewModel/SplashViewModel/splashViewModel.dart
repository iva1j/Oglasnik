import 'package:Oglasnik/view/SignInPage/widgets/FormSignIn.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/utils/colorThemes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart' as globals;

Future<void> splashScreenRouter() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  globals.email = email;

  globals.registeredGlob = false;

  print(email);
  runApp(MaterialApp(
      theme: buildThemeData(),
      home: email == null ? AnonymousHome() : RegisteredHome()));
}
