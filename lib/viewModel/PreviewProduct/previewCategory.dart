import 'package:Oglasnik/interface/productInterface.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Image buildImageWidget(String imagePath) {
  return Image.asset(imagePath);
}

class CategoryViewModel implements ReadCategoriesInterface {
  @override
  Future getCategories() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn =
        await firestore.collection('category').limit(10).getDocuments();
    return qn;
  }
}
