import 'package:Oglasnik/interface/authUserInterface.dart';
import 'package:Oglasnik/model/userModel.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;

final FirebaseAuth _auth = FirebaseAuth.instance;
final db = Firestore.instance;
bool validSignIn = false;

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final db = Firestore.instance;

  //User get user => null;

  Future getRegisteredUsers() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('users').getDocuments();
    return qn.documents;
  }

//updates the firestore users collection
  void _updateUserFirestore(User user, FirebaseUser firebaseUser) {
    db
        .document('/users/${firebaseUser.email}')
        .setData(user.toJson(), merge: true);
  }

// User registration using email and password                   //currently, this function is in use for registering (and works fine)
  Future<bool> registerWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((result) async {
        print('userID: ' + result.user.uid);
        print('email: ' + result.user.email);

        //create the new user object
        User _newUser = User(
            userID: result.user.uid,
            email: result.user.email,
            fullName: name,
            password: password);
        //update the user in firestore
        _updateUserFirestore(_newUser, result.user);
      });
      return true;
    } catch (e) {
      return false;
    }
  }

//handles updating the user when updating profile
  Future<bool> updateUser(User user, String oldEmail, String password) async {
    bool _result = false;
    await _auth
        .signInWithEmailAndPassword(email: oldEmail, password: password)
        .then((_firebaseUser) {
      _firebaseUser.user.updateEmail(user.email);
      _updateUserFirestore(user, _firebaseUser.user);
      _result = true;
    });
    return _result;
  }

//Streams the firestore user from the firestore collection
  Stream<User> streamFirestoreUser(FirebaseUser firebaseUser) {
    if (firebaseUser?.email != null) {
      return db
          .document('/users/${firebaseUser.email}')
          .snapshots()
          .map((snapshot) => User.fromDocument(snapshot.data));
    }
    return null;
  }

//best case for checking user
  Future<bool> userExistingorNot(String email, String password) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('firestoreUsers')
        .where('email', isEqualTo: email)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    print("documents = " + documents.length.toString());
    documents.length.toString() == '1' ? status = true : status = false;
    print('status: ');
    print(status);
    return documents.length == 1;
  }

  checkStatus(BuildContext context, String email, String password) {
    FutureBuilder(
        future: AuthService().userExistingorNot(email, password),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print('korisnik postoji');
            return Container();
          } else {
            print('korisnik nije u bazi');
            return Container();
          }
        });
  }

// SIGN IN
// Da li prima prave inpute?
  Future<bool> isUserRegistered(String email, String password) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('firestoreUsers')
        .where('name', isEqualTo: email)
        .where('password', isEqualTo: password)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    return documents.length == 1;
  }

  signInOrNot(BuildContext context, String email, String password) {
    FutureBuilder(
        future: AuthService().isUserRegistered(email, password),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            validSignIn = true;
            print('korisnik postoji');
            return Container();
          } else {
            print('korisnik nije u bazi');
            return Container();
          }
        });
  }

// sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}

User userFromFirebaseUser(FirebaseUser user) {
  return user != null ? User(userID: user.uid) : null;
}

class SignInAnonViewModel implements AuthSignInAnon {
  @override
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class AnonymousViewModel implements AnonymousInterface {
  @override
  Future getAnonymous() async {
    // dodjeljivanje uid-a Anonymous useru
    //final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      //AuthResult result = await auth.signInAnonymously();
      //FirebaseUser user =  result.user;
      final FirebaseUser user = (await _auth.signInAnonymously()).user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class SignOutModel implements AuthSignOut {
  @override
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}

class RegisteredUserViewModel implements RegisteredUserInterface {
  @override
  Future getRegisterUser() async {
    QuerySnapshot qn = await db.collection('Users').getDocuments();
    return qn.documents;
  }
}

// ///Generate MD5 hash
// generateMd5(String data) {
//   var content = new Utf8Encoder().convert(data);
//   var md5 = crypto.md5;
//   var digest = md5.convert(content);
//   return hex.encode(digest.bytes);
// }
