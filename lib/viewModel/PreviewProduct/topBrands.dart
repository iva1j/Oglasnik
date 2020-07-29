import 'package:Oglasnik/viewModel/PreviewProduct/categoryBrands.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
