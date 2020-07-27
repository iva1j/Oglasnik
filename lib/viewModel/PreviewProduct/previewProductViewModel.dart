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

top3BrandsPerCategory(String categoryName) async {
  final QuerySnapshot productsQuery = await Firestore.instance
      .collection('products')
      .where('productCategory', isEqualTo: categoryName)
      .getDocuments();

  final List<DocumentSnapshot> documents = productsQuery.documents;
  final List<String> stringsForReturn = List<String>();
  for (final x in documents) {
    stringsForReturn.add(x["productBrand"]);
  }

  final top3 = <String, dynamic>{};

  for (final item in stringsForReturn) {
    var numb = await numberOfProductsPerBrandTest(item);
    top3[item] = numb;
  }

  stringsForReturn.sort((a, b) => top3[b].compareTo(top3[a]));

  int i = 0;
  while (i < stringsForReturn.length - 1) {
    if (stringsForReturn[i] != stringsForReturn[i + 1])
      i++;
    else
      stringsForReturn.removeAt(i + 1);
  }

  if (stringsForReturn.length < 3) {
    final QuerySnapshot productBrands = await Firestore.instance
        .collection('categoryBrand')
        .where('categoryName', isEqualTo: categoryName)
        .getDocuments();
    final List<DocumentSnapshot> catBrandDoc = productBrands.documents;

    for (final x in catBrandDoc[0]["brands"]) {
      var numX = await numberOfProductsPerBrandTest(x);
      if (numX == 0) stringsForReturn.add(x);
      if (stringsForReturn.length >= 3) break;
    }
  }

  final mapForReturn = <String, dynamic>{};
  for (final x in stringsForReturn) {
    var numX = await numberOfProductsPerBrandTest(x);
    mapForReturn[x] = numX;
    if (mapForReturn.length == 3) break;
  }

  //return stringsForReturn.sublist(0, 3);

  return mapForReturn;
}

top3BrandsPerCategoryV2(String categoryName) async {
  final QuerySnapshot productsQuery = await Firestore.instance
      .collection('products')
      .where('productCategory', isEqualTo: categoryName)
      .getDocuments();

  final List<DocumentSnapshot> documents = productsQuery.documents;
  final List<String> stringsForReturn = List<String>();
  for (final x in documents) {
    stringsForReturn.add(x["productBrand"]);
  }

  final top3 = <String, dynamic>{};

  for (final item in stringsForReturn) {
    var numb = await numberOfProductsPerBrandTest(item);
    top3[item] = numb;
  }

  stringsForReturn.sort((a, b) => top3[b].compareTo(top3[a]));

  int i = 0;
  while (i < stringsForReturn.length - 1) {
    if (stringsForReturn[i] != stringsForReturn[i + 1])
      i++;
    else
      stringsForReturn.removeAt(i + 1);
  }

  final mapForReturn = <String, dynamic>{};
  for (final x in stringsForReturn) {
    var numX = await numberOfProductsPerBrandTest(x);
    mapForReturn[x] = numX;
    if (mapForReturn.length == 3) break;
  }

  //return stringsForReturn.sublist(0, 3);

  return mapForReturn;
}
