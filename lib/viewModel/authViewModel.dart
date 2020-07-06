import 'package:Oglasnik/interface/authUserInterface.dart';
import 'package:Oglasnik/model/userModel.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

final FirebaseAuth _auth = FirebaseAuth.instance;
final db = Firestore.instance;
bool validSignIn = false;
bool validPasswordReset = false;

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
  Future<bool> userExistingorNot(String email) async {
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

  checkStatus(BuildContext context, String email) {
    FutureBuilder(
        future: AuthService().userExistingorNot(email),
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

//if statement must be replaced with correct validation; currently status represents user in firestore (user existed)
  onPressedAlertDialog(BuildContext context, String email, String token) {
    if (1 > 0) {
      db.collection("firestoreUsers").document(email).updateData({
        'email': email,
        'token': token,
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return PasswordChange(email);
      }));
      sendemail();
      print('Za korisnika: ' +
          email +
          ' uspješno generisan token(na mail i firestore poslan), a on je: ' +
          token);
    } else {
      print('Korisnik ne postoji u bazi!');
    }
  }

//if statement must be replaced with correct validation
  void onPressedChangePassword(
    String email,
    String password,
    String passwordConfirm,
    String token,
  ) {
    if (tokenstatus == true) {
      db.collection("firestoreUsers").document(email).updateData({
        'email': email,
        'token': '',
        'password': password,
      });
      print(email);
      print('korisniku sa emailom: ' +
          email +
          ' uspješno promijenjena lozinka. \nNova lozinka je: ' +
          password);
    } else {
      print('Nešto nije uredu, molimo provjerite i ispravite grešku');
    }
  }

//tokenChecker
// Da li prima prave inpute?
  Future<bool> istokenCorrect(String email, String token) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('firestoreUsers')
        .where('email', isEqualTo: email)
        .where('token', isEqualTo: token)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> dokument = result.documents;
    if (dokument.length > 0) {
      tokenstatus = true;
      print("Email|Token status validacije je: " + tokenstatus.toString());
      return true;
    } else {
      tokenstatus = false;
      print("Email|Token status validacije je: " + tokenstatus.toString());
      print(tokenstatus);
      return false;
    }
  }

  //checking users token input (and comparing with firebase token field)
  tokenExistOrNot(BuildContext context, String email, String token) {
    FutureBuilder(
        future: AuthService().istokenCorrect(email, token),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            validPasswordReset = true;
            status = true;
            print('Token za korisnika: ' + email + ' postoji u bazi');
            return Container();
          } else {
            print('Token za korisnika: ' + email + 'NE POSTOJI u bazi');
            status = false;
            return Container();
          }
        });
  }

// SIGN IN
// Da li prima prave inpute?
  Future<bool> isUserRegistered(String email, String password) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('firestoreUsers')
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> dokument = result.documents;
    if (dokument.length > 0) {
      status = true;
      print("Trenutni status (print od SignIn-a):" + status.toString());
    } else {
      status = false;
      print("Trenutni status(print od SignIn-a):" + status.toString());
    }
  }

  signInOrNot(BuildContext context, String email, String password) {
    FutureBuilder(
        future: AuthService().isUserRegistered(email, password),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            validSignIn = true;
            status = true;
            print('korisnik postoji');
            return Container();
          } else {
            print('korisnik nije u bazi');
            status = false;
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
