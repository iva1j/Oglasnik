import 'package:Oglasnik/utils/colors_and_themes/themeData.dart';

import 'package:Oglasnik/viewModel/PreviewProduct/getAllBrands.dart';

import 'package:Oglasnik/viewModel/SignIn/SignInViewModel.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart' as globals;

Future<void> splashScreenRouter() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  globals.allBrands = await getAllBrands();
  print(globals.allBrands);
  globals.email = email;

  globals.registeredGlob = false;

  phoneNumberSetting(email);

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      home: email == null ? AnonymousHome() : RegisteredHome()));
}
