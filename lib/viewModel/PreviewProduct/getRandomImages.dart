import 'package:Oglasnik/interface/productInterface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetRandomImages implements RandomPhotoInterface {
  @override
  Future getRandomImages() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('products').getDocuments();
    return qn;
  }
}
