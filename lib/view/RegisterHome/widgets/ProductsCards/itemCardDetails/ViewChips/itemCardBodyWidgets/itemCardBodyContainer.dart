import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/itemCardBodyWidgets/itemCardContainer1.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardBody.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

Container itemCardBodyContainer(
    AsyncSnapshot snapshot, bool showMessage, BuildContext context) {
  return Container(
    padding: EdgeInsets.only(bottom: 55),
    child: ListView.builder(
      itemCount: snapshot.data.documents.length,
      itemBuilder: (_, int index) {
        if (index == snapshot.data.documents.length - 1) {
          if (locationIsSelected(
              snapshot.data.documents[index]['productLocation'],
              selectedChips)) {
            showMessage = false;

            return Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.of(context).push(
                    FadeRoute(
                      page: ProductDetails(
                        productNameScreen: snapshot.data.documents[index]
                            ['productName'],
                        productIdScreen: snapshot.data.documents[index]
                            ['productID'],
                      ),
                    ),
                  );
                },
                child: itemCardContainer1(context, snapshot, index),
              ),
            );
          } else if (showMessage == true) {
            return Container(
                height: SizeConfig.blockSizeVertical * 60,
                child: Center(child: Text(EmptyProductList().emptyList)));
          } else {
            return Container();
          }
        } else {
          if (locationIsSelected(
              snapshot.data.documents[index]['productLocation'],
              selectedChips)) {
            showMessage = false;

            return Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.of(context).push(
                    FadeRoute(
                      page: ProductDetails(
                          productNameScreen: snapshot.data.documents[index]
                              ['productName'],
                          productIdScreen: snapshot.data.documents[index]
                              ['productID']),
                    ),
                  );
                },
                child: itemCardContainer1(context, snapshot, index),
              ),
            );
          } else {
            return Container();
          }
        }
      },
    ),
  );
}
