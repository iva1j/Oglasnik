import 'package:Oglasnik/utils/colors_and_themes/themeData.dart';
import 'package:Oglasnik/viewModel/EditingUser/editUserViewModel.dart';
import 'package:Oglasnik/viewModel/FavoriteProduct/favoriteProductViewModel.dart';

import 'package:Oglasnik/viewModel/PreviewProduct/getAllBrands.dart';

import 'package:Oglasnik/viewModel/SignIn/SignInViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart' as globals;

import '../PreviewProduct/previewProduct.dart';

/*
getFavoriteProducts(email) async {
  listaProizvoda.clear();
  final QuerySnapshot favoriteProducts = await Firestore.instance
      .collection('firestoreUsers')
      .document(email)
      .collection('savedProducts')
      .getDocuments();

  List<DocumentSnapshot> allSavedProducts = favoriteProducts.documents;
  for (int i = 0; i < allSavedProducts.length; i++) {
    listaProizvoda.add(allSavedProducts[i]["productID"]);
  }
  print('printic: ');
  print(listaProizvoda);
  print("novi red:");
}
*/
Future<void> splashScreenRouter() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  globals.allBrands = await getAllBrands();
  globals.email = email;
  globals.favoritesList.clear();
  FavoriteProduct().getAllFavoritesIDs().then((value) =>
      {for (final x in value) globals.favoritesList.add(x['productID'])});

  globals.registeredGlob = false;

  phoneNumberSetting(email);

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      home: email == null ? AnonymousHome() : RegisteredHome()));
}
