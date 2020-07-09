import 'dart:async';

import 'package:Oglasnik/utils/groupOfFunctions.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:Oglasnik/viewModel/authViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
    RegisterControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void onPressedRegister(BuildContext context, String fullName, String email,
    String password, String phoneNumber, dynamic formKey) {
  FocusScope.of(context).unfocus();
  FocusScope.of(context).requestFocus(new FocusNode()); //remove focus
  Timer(Duration(milliseconds: 300), () {
    if (formKey.currentState.validate() && status == false) {
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

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return RegisteredHome();
        }),
      );
    } else {
      print('korisnik već u bazi, registracija nije uspjela');
    }
  });
}
