import 'package:Oglasnik/interface/authUserInterface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AnonymousViewModel implements AnonymousInterface {
  @override
  Future getAnonymous() async {               // dodjeljivanje uid-a Anonymous useru
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      AuthResult result = await auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class RegisteredUserViewModel implements RegisteredUserInterface {
  @override
  Future getRegisterUser() async {
    var auth = Firestore.instance;
    QuerySnapshot qn = await auth.collection('Users').getDocuments();
    return qn.documents;
  }
}
