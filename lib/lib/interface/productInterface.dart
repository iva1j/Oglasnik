import 'package:flutter/cupertino.dart';

abstract class ProductInterface {
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
      productCijena);
}
