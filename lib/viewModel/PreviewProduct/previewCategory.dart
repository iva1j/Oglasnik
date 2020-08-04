import 'package:Oglasnik/interface/productInterface.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Image buildImageWidget(String imagePath) {
  return Image.asset(imagePath);
}

class CategoryViewModel implements ReadCategoriesInterface {
  @override
  getCategories() async {
    var firestore = Firestore.instance;
    QuerySnapshot queryCategories =
        await firestore.collection('category').getDocuments();

    List<DocumentSnapshot> cats = queryCategories.documents;

    List<DocumentSnapshot> forReturn = List<DocumentSnapshot>();

    QuerySnapshot queryProducts =
        await firestore.collection('products').getDocuments();
    List<DocumentSnapshot> prods = queryProducts.documents;

    prods.sort((a, b) => a['productCategory'].compareTo(b['productCategory']));

    int i = 0;
    while (i < prods.length - 1) {
      if (prods[i]['productCategory'] != prods[i + 1]['productCategory'])
        i++;
      else
        prods.removeAt(i + 1);
    }

    for (final x in cats) {
      for (final y in prods) {
        if (x['categoryName'] == y['productCategory']) forReturn.add(x);
      }
    }

    return forReturn;
  }
}

class CityViewModel implements ReadCitiesInterface {
  @override
  Future getCitiesFromProducts() async {
    var firestore = Firestore.instance;
    QuerySnapshot queryCities =
        await firestore.collection('category').getDocuments();
    return queryCities;
  }
}
