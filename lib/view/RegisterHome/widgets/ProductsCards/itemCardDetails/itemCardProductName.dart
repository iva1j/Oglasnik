import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/itemName.dart';
import 'package:flutter/material.dart';

InkWell itemCardProductName(
    BuildContext context, AsyncSnapshot snapshot, int index) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ProductDetails(
                productNameScreen: snapshot.data.documents[index]
                    ['productName'],
              )));
    },
    child: ItemName(
      name: snapshot.data.documents[index]['productName'],
    ),
  );
}
