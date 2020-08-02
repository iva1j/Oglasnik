import 'package:cloud_firestore/cloud_firestore.dart';

Future getBrandData(String productBrand) async {
  List slikeBrandova = [];
  final QuerySnapshot getBrandData = await Firestore.instance
      .collection('products')
      .where('productBrand', isEqualTo: productBrand)
      .getDocuments();

  final List<DocumentSnapshot> brandData = getBrandData.documents;
  brandData.forEach((element) {
    if (element["productImg1"] != null) {
      slikeBrandova.add(element['productImg1']);
    }
    if (element["productImg2"] != null) {
      slikeBrandova.add(element['productImg2']);
    }
    if (element["productImg3"] != null) {
      slikeBrandova.add(element['productImg3']);
    }
  });
  while (slikeBrandova.length < 4) {
    slikeBrandova.add(
        'https://firebasestorage.googleapis.com/v0/b/oglasnik-d920b.appspot.com/o/images%2Fnophoto.jpg?alt=media&token=a4d040c4-b5b4-4c13-a49d-b6ecf292fafe');
  }
  return slikeBrandova;
}
