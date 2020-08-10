import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

///Method that is getting all brands from categories in our db
///this method is called at the first loading of the page (main.dart)
void initCategoryBrands() async {
  final QuerySnapshot brandsQuery =
      await Firestore.instance.collection('categoryBrand').getDocuments();
  final List<DocumentSnapshot> documents = brandsQuery.documents;
  documents.forEach((element) {
    categoryBrands[element["categoryName"]] = element["brands"];
  });

  print(categoryBrands["Sportska Oprema"].runtimeType);

  print(categoryBrands);

  documents.forEach((element) {
    print(element.runtimeType);
  });
}

///this function is used in FutureBuilder as a Future function
///
///it's checking userInput that is stored in [brandName] in all products
///from database ['productBrand'] field in [products] collection
///
numberOfProductsPerBrandTest(String brandName, String categoryName) async {
  final QuerySnapshot productsQuery = await Firestore.instance
      .collection('products')
      .where('productBrand', isEqualTo: brandName)
      .where('productCategory', isEqualTo: categoryName)
      .getDocuments();
  final List<DocumentSnapshot> documents = productsQuery.documents;
  return documents.length;
}
