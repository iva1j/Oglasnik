import 'package:flutter/cupertino.dart';

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
      productCijena;
  Product(
      {@required this.productBrand,
      @required this.productCategory,
      @required this.productCijena,
      @required this.productID,
      @required this.productLocation,
      @required this.productName,
      this.productDesc,
      this.productImg1,
      this.productImg2,
      this.productImg3,
      this.productTag});
}
