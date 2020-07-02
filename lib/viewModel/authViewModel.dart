import 'package:Oglasnik/interface/authUserInterface.dart';
import 'package:Oglasnik/model/userModel.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final db = Firestore.instance;
bool checkUser = false;
bool isLogin = false;

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final db = Firestore.instance;

  Future getRegisteredUsers() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('users').getDocuments();
    return qn.documents;
  }

  //updates the firestore users collection    //currently inactive
  void _updateUserFirestore(User user, FirebaseUser firebaseUser) {
    db
        .document('/users/${firebaseUser.email}')
        .setData(user.toJson(), merge: true);
  }

//handles updating the user when updating profile but using Firebase Auth which we are not using in this project. However, it can help us to see how it works
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

//checking is user exist or not in firestore
  Future<bool> userExistingorNot(String email, String password) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('firestoreUsers')
        .where('email', isEqualTo: email)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    //print("documents = " + documents.length.toString());
    return documents.length == 1;
  }

// this is not working because we are using another approach for signing in (not over the Firebase Auth)
  Future<bool> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => RegisteredHome())));
      print('user successful signed in ');
      return true;
    } catch (e) {
      return false;
    }
  }

//Method to handle user sign in using email and password -> by this function, we have to sign in user into our app (this feature is not working properly yet!)
  Future<bool> signInOverFirestore(String email, String password) async {
    db
        .collection('firestoreUsers')
        .where('email', isEqualTo: email)
        .getDocuments()
        .then(
          (value) => print('User on Firestore : $value'),
        )
        .catchError((e) {
      print('Error no document');
    });
    return true;
  }

  //  Future<FirebaseUser> get getUser => _auth.currentUser(); //geting currentUser from Firebase Auth
}

//checking users state (if he's logged in, from splash screen it must forward him to RegisteredHome screen)
User userFromFirebaseUser(FirebaseUser user) {
  return user != null ? User(userID: user.uid) : null;
}

//Signing in user over Firebase Auth
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

//check usability of this function once when we finish with Sign in and Sign up features (US1 and US2)
class AnonymousViewModel implements AnonymousInterface {
  @override
  Future getAnonymous() async {
    try {
      final FirebaseUser user = (await _auth.signInAnonymously()).user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

// sign out implementation
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
