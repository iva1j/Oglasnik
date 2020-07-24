import 'package:Oglasnik/main.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productBrandCard.dart';
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

  print(globals.email);
  print(globals.phoneNumber);

  print("LSASDSAGASHAHADH");
  //numberOfProductsPerBrandTest("Ford").then((value) => print(value));

  //print(top3BrandsPerCategory("Automobili"));

  //top3BrandsPerCategory("Automobili");
  print("AHDAHADHADHDHAHDADHADJ");

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      home: email == null ? AnonymousHome() : RegisteredHome()));
}
