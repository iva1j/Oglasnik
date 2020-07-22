import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Product {
  String productName,
      email,
      phoneNumber,
      productID,
      productCategory,
      productBrand,
      productLocation,
      productTag,
      productDesc,
      productImg1,
      productImg2,
      productImg3,
      productCijena;
  Product(
      {@required this.productBrand,
      @required this.productCategory,
      @required this.productCijena,
      @required this.productID,
      @required this.productLocation,
      @required this.productName,
      this.phoneNumber,
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
      phoneNumber: doc['phoneNumber'],
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

class ProductCategory {
  String categoryName, icon, categoryID;
  ProductCategory(
      {@required this.categoryName,
      @required this.categoryID,
      @required this.icon});
  factory ProductCategory.fromDocument(DocumentSnapshot doc) {
    return ProductCategory(
      categoryName: doc['categoryName'],
      icon: doc['categoryIcon'],
      categoryID: doc['categoryID'],
    );
  }
}

class ProductBrand {
  String categoryName, categoryID, categoryBrandID;
  List<String> brands;
  ProductBrand(
      {@required this.categoryName,
      @required this.categoryID,
      @required this.brands,
      this.categoryBrandID});
  factory ProductBrand.fromDocument(DocumentSnapshot doc) {
    return ProductBrand(
      categoryName: doc['categoryName'],
      categoryID: doc['categoryID'],
      brands: List.from(doc['brands']),
      categoryBrandID: doc['categoryBrandID'],
    );
  }
}
