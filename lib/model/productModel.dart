import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String productName,
      productID,
      productCategory,
      productBrand,
      productLocation,
      productTag,
      productDesc,
      productImg1,
      productImg2,
      productImg3,
      email,
      productCijena;
  Product(
      {@required this.productBrand,
      @required this.productCategory,
      @required this.productCijena,
      @required this.productID,
      @required this.productLocation,
      @required this.productName,
      this.productDesc,
      this.email,
      this.productImg1,
      this.productImg2,
      this.productImg3,
      this.productTag});

  factory Product.fromDocument(DocumentSnapshot doc) {
    return Product(
      productName: doc['productName'],
      email: doc['email'],
      productBrand: doc['productBrand'],
      productCategory: doc['productCategory'],
      productCijena: doc['cijena'],
      productID: doc['productID'],
      productLocation: doc['productLocation'],  
      productDesc: doc['productDesc'],
      productTag: doc['productTag'],
      productImg1: doc['productImg1'],    
      productImg2: doc['productImg2'],
      productImg3: doc['productImg3'],
    );
  }
}
