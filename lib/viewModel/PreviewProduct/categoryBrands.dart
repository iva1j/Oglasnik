import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

Future<bool> checkIfProductBrandExists(String brandName) async {
  final QuerySnapshot productsQuery = await Firestore.instance
      .collection('products')
      .where('brandName', isEqualTo: brandName)
      .getDocuments();

  final List<DocumentSnapshot> documents = productsQuery.documents;
  return documents.length > 0;
}

numberOfProductsPerBrandTest(String brandName) async {
  final QuerySnapshot productsQuery = await Firestore.instance
      .collection('products')
      .where('productBrand', isEqualTo: brandName)
      .getDocuments();

  final List<DocumentSnapshot> documents = productsQuery.documents;

  return documents.length;
}
