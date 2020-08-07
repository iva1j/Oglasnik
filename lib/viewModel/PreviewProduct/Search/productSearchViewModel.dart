import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryLoading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

///Faruk Cidic
///
///Bellow is a widget that is called on main(categoryScreen) just for getting all products from db
///Later on, we are storing all products in a list type [DocumentSnapshot] but since we are doing this
///because of [Search suggestion], we are in need for list of String. So bellow, we are converting
///products from one list to the right one. 

class ProductSearchDB extends StatelessWidget {
  List<DocumentSnapshot> allProductsObject = List<DocumentSnapshot>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firestore.instance.collection('products').getDocuments(),
      builder: (BuildContext context, AsyncSnapshot snapshott) {
        if (snapshott.hasData) {
          productsForSearch.clear();
          allProductsObject.clear();
          allProductsObject = snapshott.data.documents;
          allProductsObject.forEach((element) {
            productsForSearch.add(element['productName']);
          });
          print("Lista svih proizvoda u ispravnom builderu: " +
              productsForSearch.toString());
          return Container();
        } else {
          return Container();
        }
      },
    );
  }
}
