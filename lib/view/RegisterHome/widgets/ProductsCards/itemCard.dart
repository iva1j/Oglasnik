import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardBody.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/itemDescription.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/itemImage.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/itemName.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/itemPrice.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/oglasTag.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';

class ItemCard extends StatefulWidget {
  //String audi = "assets/images/audi.jpg";
  final String brandNameScreen;
  ItemCard({Key key, @required this.brandNameScreen}) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: AppBarTheme.of(context).color,
          centerTitle: true,
          title: Text(widget.brandNameScreen),
        ),
        floatingActionButton: email != null
            ? mainFloatingButton(email)
            : homeFloatingAnimatedButton(),
        bottomSheet: Container(
          height: 55,
          width: double.infinity,
          color: Color.fromARGB(255, 226, 11, 48),
        ),
        body: ItemCardBody(widget: widget));
  }
}
