import 'dart:async';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/internetAlertDialog.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/successAlertDialog.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/successOnCreateAlertDialog.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Oglasnik/utils/checkForInternetConnection.dart';
import 'package:Oglasnik/utils/globals.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/internetDialog.dart';

TextEditingController signInEmailInputController;
TextEditingController emailInputControllerAlertDialog =
    new TextEditingController();
TextEditingController signInPasswordInputController;
//When user enter his email on AlertDialog, button "pošalji" is configured bellow
void onPressedPosaljiKod(BuildContext context) {
  // Container(
  //     child: AuthService()
  //         .allowPasswordChange(context, emailInputControllerAlertDialog.text));
  AuthService().onPressedAlertDialog(
      context, emailInputControllerAlertDialog.text, tokenCode);
}

//When user enter his email on AlertDialog, onPressed "odustani" is bellow:
void alerDialogOnPressedOdustani(BuildContext context) {
  Navigator.of(context).pop();
  emailInputController.clear();
}

//onPressed toggle that switch SignIn screen to SignUp
void toggleRegister(BuildContext context) {
  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => RegisterPage(),
    ),
  );
  cleanLoginInputFields();
}

void cleanLoginInputFields() {
  emailInputController.clear();
  passwordInputController.clear();
}

void onPressedSignInModel(
    BuildContext context, String email, String password, dynamic formKey) {
  FocusScope.of(context).unfocus();
  FocusScope.of(context).requestFocus(new FocusNode()); //remove focus
  print('Internet konekcija dostupna: ' + hasInternetConnection.toString());
  if (!isOnline) {
    Timer(Duration(seconds: 1), () {
      if (formKey.currentState.validate() && status == true) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          signInEmailInputController.clear();
          signInPasswordInputController.clear();
        });
        print('Logged in');
        globals.email = email;
        loginPrefs(context, email);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            registeredGlob = false;
            return RegisteredHome();
          }),
        );
      } else {
        print('Email ili password nisu tacni');
      }
    });
  } else
    displayInternetDialog(context);
}

void loginPrefs(BuildContext context, String email) async {
  phoneNumberSetting(email);
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setString('email', email);
  //prefs.setString('phoneNumber', phoneNumber);
}

void phoneNumberSetting(String email) async {
  final userQuery = await Firestore.instance
      .collection('firestoreUsers')
      .where('email', isEqualTo: email)
      .limit(1);
  //print(userQuery.getDocuments());
  userQuery.getDocuments().then((data) {
    if (data.documents.length > 0) {
      phoneNumber = data.documents[0].data['phoneNumber'];
    }
  });
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

registeredShowDialog(BuildContext context) {
  if (registeredGlob) {
    registeredGlob = false;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
          context: context,
          builder: (BuildContext context) => successAlertDialog(context));
    });
  }
}

createdShowDialog(BuildContext context) {
  if (createdGlob) {
    createdGlob = false;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
          context: context,
          builder: (BuildContext context) =>
              successOnCreateAlertDialog(context));
    });
  }
}
