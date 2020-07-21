import 'package:Oglasnik/interface/productInterface.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Image buildImageWidget(String imagePath) {
  return Image.asset(imagePath);
}

class ProductViewModel implements ReadProductInterface {
  @override
  Future getProduct() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('products').getDocuments();
    return qn;
  }
}
