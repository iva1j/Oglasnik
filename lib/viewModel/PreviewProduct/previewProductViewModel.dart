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
