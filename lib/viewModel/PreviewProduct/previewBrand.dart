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

    List<DocumentSnapshot> l = qn.documents;

    l.sort((a, b) => a['productBrand'].compareTo(b['productBrand']));
    int i = 0;
    while (i < l.length - 1) {
      if (l[i]['productBrand'] == l[i + 1]['productBrand'])
        l.removeAt(i + 1);
      else
        i++;
    }
    print("AAAAAAAAAA");
    print(l);
    print("BBBBBBBBB");
    return l;
    //return qn;
  }
}
