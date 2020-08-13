import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

// List<DocumentSnapshot> userInformations = List<DocumentSnapshot>();
// List userInfo = [];

@override
Future<List<DocumentSnapshot>> getCurrentUserInfo(String email) async {
  var firestore = Firestore.instance;
  QuerySnapshot qn = await firestore
      .collection('firestoreUsers')
      .where('email', isEqualTo: email)
      .getDocuments();
  return qn.documents;
}

