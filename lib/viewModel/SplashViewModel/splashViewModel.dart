import 'package:Oglasnik/main.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productBrandCard.dart';
import 'package:Oglasnik/utils/colors_and_themes/themeData.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewCategory.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewProductViewModel.dart';
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
  globals.email = email;

  globals.registeredGlob = false;

  print(globals.email);
  print(globals.phoneNumber);

  print("LSASDSAGASHAHADH");
  //numberOfProductsPerBrandTest("Ford").then((value) => print(value));
/*
  top3BrandsPerCategory("Nakit")
      .then((value) => value.forEach((x) => print(x)));
*/
  CategoryViewModel().getCategories().then(
      (value) => value.forEach((element) => print(element['productCategory'])));

  //top3BrandsPerCategory("Automobili");
  print("AHDAHADHADHDHAHDADHADJ");

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      home: email == null ? AnonymousHome() : RegisteredHome()));
}
