import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/itemCardBodyWidgets/itemCardBodyDesc.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardImage.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardPrice.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardProductName.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';

import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

Container itemCardContainer1(
    BuildContext context, AsyncSnapshot snapshot, int index) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
      border: Border.all(
        color: Colors.black26,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
    ),
    margin: EdgeInsets.only(
      left: SizeConfig.blockSizeHorizontal * 5,
      right: SizeConfig.blockSizeHorizontal * 5,
      top: SizeConfig.blockSizeVertical * 4,
      bottom: SizeConfig.blockSizeVertical * 2,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  itemCardProductName(context, snapshot.data.documents[index]),
                  itemCardBodyDesc(snapshot, index),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  itemCardImage(snapshot.data.documents[index]),
                  itemCardPrice(snapshot.data.documents[index]),
                ],
              ),
            ),
          ],
        ),
        Divider(
          thickness: SizeConfig.blockSizeVertical * 0.2,
        ),
        itemCardTags(snapshot.data.documents[index]),
      ],
    ),
  );
}
