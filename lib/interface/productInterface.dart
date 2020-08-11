import 'package:flutter/cupertino.dart';

abstract class ProductInterface {
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
      productCijena);
}

abstract class UpdateProductInterface {
  Future updateProduct(String productID);
}

abstract class ReadProductInterface {
  Future getProduct();
}

abstract class ReadCategoriesInterface {
  Future getCategories();
}

abstract class ReadBrandInterface {
  Future getBrandsByCategories(String categoryName);
}

abstract class ReadCitiesInterface {
  Future getCitiesFromProducts();
}
