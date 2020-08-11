import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardBody.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/SearchPage/ProductSearch/itemProductWidgets/itemContainer.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/SearchPage/ProductSearch/itemProductName.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<DocumentSnapshot> selectedProducts = List<DocumentSnapshot>();

class ItemProductContainer extends StatelessWidget {
  const ItemProductContainer({
    Key key,
    @required this.selectedProducts,
    @required this.showMessage,
  }) : super(key: key);

  final List<DocumentSnapshot> selectedProducts;
  final bool showMessage;

  @override
  Widget build(BuildContext context) {
    bool showMessage = true;
    return Container(
      padding: EdgeInsets.only(bottom: 55),
      child: ListView.builder(
        itemCount: selectedProducts.length,
        itemBuilder: (_, int index) {
          if (index == selectedProducts.length - 1) {
            if (locationIsSelected(
                selectedProducts[index]['productLocation'], selectedChips)) {
              showMessage = false;

              return Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    itemProductName(context, index);
                  },
                  child: itemContainer(context, index),
                ),
              );
            } else if (showMessage == true) {
              return Container(
                  margin: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockSizeVertical * 30),
                  child: Center(child: Text(EmptyProductList().emptyList)));
            } else {
              return Container();
            }
          } else {
            if (locationIsSelected(
                selectedProducts[index]['productLocation'], selectedChips)) {
              showMessage = false;

              return Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    itemProductName(context, index);
                  },
                  child: itemContainer(context, index),
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
}
