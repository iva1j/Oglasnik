import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/phoneNumberButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/oglasTag.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/showimage.dart';
import 'package:intl/intl.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';

Column phoneNumberWidget(int index) {
  return Column(
    children: <Widget>[
      Text(
        products[index].phoneNumber == null
            ? 'Korisnik nema broj'
            : products[index].phoneNumber,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
      ),
      Text(
        ProductDetailsStrings().callInfoText,
        style: TextStyle(
          //Hexcolor("#95989A"),
          color: Color.fromARGB(160, 255, 255, 255),
          fontWeight: FontWeight.w100,
        ),
      ),
    ],
  );
}
