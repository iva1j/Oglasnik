import 'dart:async';

import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:Oglasnik/viewModel/SignIn/SignInViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart' as globals;

import 'package:Oglasnik/utils/globals.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/internetDialog.dart';

class RegisterButton extends StatefulWidget {
  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  //bool isRegistered = false;
  final db = Firestore.instance;
  TextEditingController fullNameInputController;
  TextEditingController phoneNumberInputController;
  TextEditingController emailInputController;
  TextEditingController passwordInputController;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void onPressedRegister(BuildContext context, String fullName, String email,
    String password, String phoneNumber) {
  FocusScope.of(context).unfocus();
  FocusScope.of(context).requestFocus(new FocusNode()); //remove focus
  //if (!isOnline) {
  Timer(Duration(seconds: 1), () {
    if (signUpRegisterFormKey.currentState.validate() && allowUserToRegister) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        signUpPhoneNumberInputController.clear();
        signUpPasswordInputController.clear();
        signUpEmailInputController.clear();
        signUpFullNameInputController.clear();
      }); // clear content

      db.collection("firestoreUsers").document(email).setData({
        'fullName': fullName,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
      });
      print('korisnik uspješno ubačen u bazi');

      loginPrefs(context, email);
      globals.email = email;

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          registeredGlob = true;
          return RegisteredHome();
        }),
      );
    } else {
      print('korisnik već u bazi, registracija nije uspjela');
    }
  });
  // } else
  //   displayInternetDialog(context);
}
