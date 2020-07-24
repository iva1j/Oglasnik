import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void initCategoryNames() async {
  final QuerySnapshot categoryQuery =
      await Firestore.instance.collection('category').getDocuments();
  final List<DocumentSnapshot> documents = categoryQuery.documents;
  documents.forEach((element) {
    categoryNames.add(element["categoryName"]);
  });
}

Future<String> returnCategoryName(String id) async {
  final QuerySnapshot categoryNameQuery = await Firestore.instance
      .collection('category')
      .where('categoryID', isEqualTo: id)
      .limit(1)
      .getDocuments();

  final List<DocumentSnapshot> documents = categoryNameQuery.documents;
  String s;
  documents.forEach((element) => s = element["categoryName"]);
  return s;
}

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
/*
Future<bool> checkIfProductBrandExists(String brandName) async {
  final QuerySnapshot productsQuery =
      await Firestore.instance.collection('products').getDocuments();

  final List<DocumentSnapshot> documents = productsQuery.documents;

  documents.forEach((element) {
    if (element["brandName"] == brandName) return true;
  });

  return false;
}
*/

Future<bool> checkIfProductBrandExists(String brandName) async {
  final QuerySnapshot productsQuery = await Firestore.instance
      .collection('products')
      .where('brandName', isEqualTo: brandName)
      .getDocuments();

  final List<DocumentSnapshot> documents = productsQuery.documents;
  return documents.length > 0;
}

/*
Future<int> numberOfProductsPerBrand(String brandName) async {
  final QuerySnapshot productsQuery = await Firestore.instance
      .collection('products')
      //.where('productBrand', isEqualTo: brandName)
      .getDocuments();

  print(productsQuery);

  final List<DocumentSnapshot> documents = productsQuery.documents;
  print(documents);
  print(brandName + " ima ");
  print(documents.length);
  return documents.length;
}
*/
numberOfProductsPerBrandTest(String brandName) async {
  final QuerySnapshot productsQuery = await Firestore.instance
      .collection('products')
      .where('productBrand', isEqualTo: brandName)
      .getDocuments();

  final List<DocumentSnapshot> documents = productsQuery.documents;

  return documents.length;
}

// implementacija ove funkcije blizu kraju
/*
top3BrandsPerCategory(String categoryName) async {
  final QuerySnapshot productsQuery = await Firestore.instance
      .collection('products')
      .where('productCategory', isEqualTo: categoryName)
      .getDocuments();

  final List<DocumentSnapshot> documents = productsQuery.documents;

  final top3 = <DocumentSnapshot, dynamic>{};

  for (final item in documents) {
    var numb = await numberOfProductsPerBrandTest(item["productBrand"]);
    top3[item] = numb;
  }

  documents.sort((a, b) => top3[b].compareTo(top3[a]));

  if (documents.length == 0 || documents.length == 1) return documents;
  int i = 0;
  while (i < documents.length - 1) {
    //if (i + 1 == documents.length) break;
    if (documents[i]["productBrand"] != documents[i + 1]["productBrand"])
      i++;
    else
      documents.removeAt(i + 1);
  }

  if (documents.length < 3) {
    final QuerySnapshot productBrands = await Firestore.instance
        .collection('categoryBrand')
        .where('categoryName', isEqualTo: categoryName)
        .getDocuments();
    final List<DocumentSnapshot> docs = productBrands.documents;
    //...
    while (documents.length < 3) {}
  }

  //return documents.sublist(0, 3);
}
*/
