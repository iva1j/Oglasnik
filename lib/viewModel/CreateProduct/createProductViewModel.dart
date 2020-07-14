import 'package:Oglasnik/interface/productInterface.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateProduct extends ProductInterface {
  @override
  Future createProduct(
      BuildContext context,
      String email,
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
      productCijena) async {
    db.collection("products").document(productID).setData({
      'productID': productID,
      'email': email,
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
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => RegisteredHome()));
  }
}
