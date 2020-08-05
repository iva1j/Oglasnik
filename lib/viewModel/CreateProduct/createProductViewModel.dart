import 'package:Oglasnik/interface/productInterface.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Class that is used for creating products in Firestore
///Method createProduct is called once when user click 'Završi' button
class CreateProduct extends ProductInterface {
  @override
  Future createProduct(
      BuildContext context,
      String email,
      phoneNumber,
      productName,
      productID,
      productCategory,
      productBrand,
      productLocation,
      productTag,
      productDesc,
      productImg1,
      productImg2,
      productImg3,
      productCijena) {
    db.collection("products").document(productID).setData({
      'productID': productID,
      'email': email,
      'phoneNumber': phoneNumber,
      'productName': productName,
      'productCategory': productCategory,
      'productBrand': productBrand,
      'productLocation': productLocation,
      'cijena': productCijena,
      'productTag': productTag,
      'productDesc': productDesc,
      'productImg1': productImg1,
      'productImg2': productImg2,
      'productImg3': productImg3,
    });
    return null;
  }
}
