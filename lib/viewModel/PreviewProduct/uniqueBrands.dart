import 'package:cloud_firestore/cloud_firestore.dart';

uniqueBrandsPerCategory(String categoryName) async {
  var firestore = Firestore.instance;
  QuerySnapshot qn = await firestore
      .collection('products')
      .where('productCategory', isEqualTo: categoryName)
      .getDocuments();

  List<DocumentSnapshot> list = qn.documents;
  List<String> uniqueBrands;
  list.forEach((element) {
    uniqueBrands.add(element["productBrand"]);
  });
  uniqueBrands = uniqueBrands.toSet().toList();
  return uniqueBrands;
}
