import 'dart:async';

import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:flutter/material.dart';

TextEditingController signInEmailInputController;
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
  //ovdje pozvati
  FocusScope.of(context).unfocus();
  FocusScope.of(context).requestFocus(new FocusNode()); //remove focus
  Timer(Duration(seconds: 1), () {
    if (formKey.currentState.validate() && status == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        signInEmailInputController.clear();
        signInPasswordInputController.clear();
      });
      print('Logged in');

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return RegisteredHome();
        }),
      );
    } else {
      print('Email ili password nisu tacni');
    }
  });
}
