import 'dart:async';

import 'package:Oglasnik/interface/authUserInterface.dart';
import 'package:Oglasnik/model/userModel.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:Oglasnik/view/SignInPage/pages/signin.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';
import 'package:Oglasnik/view/SignInPage/widgets/sendMail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final db = Firestore.instance;
bool validSignIn = false;
bool validPasswordReset = false;

class AuthService extends ChangeNotifier {
// FUTURE BUILDER FOR REGISTER
  Future<bool> userExistingorNot(String email) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('firestoreUsers')
        .where('email', isEqualTo: email)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    if (documents.length > 0) {
      allowUserToRegister = false;
      print("Hoce li pustiti Usera da se registruje: " +
          allowUserToRegister.toString());
    } else {
      print("Hoce li pustiti Usera da se registruje" +
          allowUserToRegister.toString());
      allowUserToRegister = true;
      print(allowUserToRegister);
    }
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
    FocusScope.of(context).unfocus();
    FocusScope.of(context).requestFocus(new FocusNode()); //remove focus
    Timer(Duration(milliseconds: 800), () {
      if (alertFormKey.currentState.validate() &&
          allowUserToChangePassword == true) {
        // FocusScope.of(context).unfocus();
        // FocusScope.of(context).requestFocus(new FocusNode());
        //remove focus
        WidgetsBinding.instance.addPostFrameCallback((_) {
          emailInputControllerAlertDialog.clear();
        });
        db.collection("firestoreUsers").document(email).updateData({
          'email': email,
          'token': token,
        });
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return PasswordChange(email);
        }));
        // sendemail();
        print('Za korisnika: ' +
            email +
            ' uspješno generisan token(na mail i firestore poslan), a on je: ' +
            token);
      } else {
        print('Korisnik ne postoji u bazi!');
      }
    });
  }

//if statement must be replaced with correct validation
  void onPressedChangePassword(
      BuildContext context,
      String email,
      String newPassword,
      String passwordConfirm,
      String token,
      dynamic formKey) {
    FocusScope.of(context).unfocus();
    FocusScope.of(context).requestFocus(new FocusNode()); //remove focus
    Timer(Duration(seconds: 1), () {
      if (formKey.currentState.validate() &&
          tokenstatus == true &&
          newPassword == passwordConfirm) {
        db.collection("firestoreUsers").document(email).updateData({
          'email': email,
          'token': '',
          'password': newPassword,
        });
        print(email);
        print('korisniku sa emailom: ' +
            email +
            ' uspješno promijenjena lozinka. \nNova lozinka je: ' +
            newPassword);

        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => SigninPage()));
      } else if (newPassword != passwordConfirm) {
        nepoklapanje = true;
        print('lozinke se ne poklapaju');
      } else {
        print('Nešto nije uredu, molimo provjerite i ispravite grešku');
      }
    });
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
            print('Token za korisnika: ' + email + ' postoji u bazi');
            return Container();
          } else {
            print('Token za korisnika: ' + email + 'NE POSTOJI u bazi');
            return Container();
          }
        });
  }

// SIGN IN
// FUTURE BUILDER ZA LOGIN (HOCE LI GA PUSTITI DA SE LOG IN)
  // ignore: missing_return
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

//alert dialog checker
//FUTURE BUILDER ZA ALERT DIALOG (HOCE LI MU PUSTITI DA PROMIJENI PASSWORD)
//best case for checking user in database!
  Future<bool> isEmailValid(String email) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('firestoreUsers')
        .where('email', isEqualTo: email)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> emailDoc = result.documents;
    if (emailDoc.length > 0) {
      allowUserToChangePassword = true;
      print("Trenutni status Alert Dialoga:" +
          allowUserToChangePassword.toString());
    } else {
      allowUserToChangePassword = false;
      print("Trenutni status Alert Dialoga:" +
          allowUserToChangePassword.toString());
    }
  }

  allowPasswordChange(BuildContext context, String email) {
    FutureBuilder(
        future: AuthService().isEmailValid(email),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            allowUserToChangePassword = true;
            print('korisnik postoji');
            return Container();
          } else {
            print('korisnik nije u bazi');
            allowUserToChangePassword = false;
            return Container();
          }
        });
  }

  //above alert dialog checker

  updateUser(User updatedUser, String oldEmail, String text) {}
}

final FirebaseAuth _auth = FirebaseAuth.instance;

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
