import 'package:Oglasnik/interface/productInterface.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BrandViewModel implements ReadBrandInterface {
  @override
  Future getBrandsByCategories(String categoryName) async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection('categoryBrand')
        .where('categoryName', isEqualTo: categoryName)
        .getDocuments();
    return qn;
  }
}
