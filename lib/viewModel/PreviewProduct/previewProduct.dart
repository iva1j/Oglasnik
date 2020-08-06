import 'package:Oglasnik/interface/productInterface.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

///Future function that takes all product from db and it's used in a Future Builder 
///for listing(showing) all products once when user cancel his Search in App.
///
class ProductViewModel implements ReadProductInterface {
  @override
  Future getProduct() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('products').getDocuments();
    return qn;
  }
}
