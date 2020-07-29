import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/oglasTag.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Oglasnik/utils/strings.dart';
import '../../showimage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/showimage.dart';
import 'package:intl/intl.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';

Container phoneNumberButtonWidget(int index) {
  return Container(
    margin: EdgeInsets.only(
      left: SizeConfig.blockSizeHorizontal * 8,
      top: SizeConfig.blockSizeVertical * 1.7,
      bottom: SizeConfig.blockSizeVertical * 1.7,
    ),
    decoration: BoxDecoration(
        border: Border.all(color: Hexcolor("#95989A")),
        borderRadius: BorderRadius.all(Radius.circular(0))),
    child: FlatButton(
      onPressed: () =>
          CallsAndMessagesService().call(products[index].phoneNumber),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)),
      color: mainAppColor,
      child: Text(
        ProductDetailsStrings().callText,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
