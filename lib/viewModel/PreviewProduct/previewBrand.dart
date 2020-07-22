import 'package:Oglasnik/interface/productInterface.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class BrandViewModel implements ReadBrandInterface {
  @override
  Future getBrandsByCategories(String categoryName) async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection('products')
        .where('productCategory', isEqualTo: categoryName)
        .getDocuments();
    return qn;
  }
}
