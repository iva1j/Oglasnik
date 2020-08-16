import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:Oglasnik/viewModel/SignIn/SignInViewModel.dart';
import 'package:flutter/material.dart';

class InputFields {
  TextEditingController emailInputController = new TextEditingController();
  TextEditingController passwordInputController = new TextEditingController();
}

alertDialogInitControllers() {
  //alertFormKey = GlobalKey<FormState>();
  emailInputControllerAlertDialog = new TextEditingController();
}

cleanRegister() {
  registerFullName = null;
  registerPassword = null;
  registerPhoneNumber = null;
  registerEmail = null;
}

cleanSignIn() {
  signInEmail = null;
  signInPassword = null;
}

alertDialogDispose() {
  alertFormKey = GlobalKey<FormState>();
  emailInputControllerAlertDialog.dispose();
}

passwordChangeInitControllers() {
  emailInputController = new TextEditingController();
  tokenInputController = new TextEditingController();
  confirmPasswordInputController = new TextEditingController();
  passwordChangeFormKey = GlobalKey<FormState>();
}

passwordChangeDispose() {
  passwordChangeFormKey.currentState.dispose();
  emailInputController.dispose();
  tokenInputController.dispose();
  confirmPasswordInputController.dispose();
}

/*
pageViewInitControllers() {
  productNameController = new TextEditingController();
  productTagController = new TextEditingController();
  productDescController = new TextEditingController();
  productPriceController = new TextEditingController();
}
*/
dropDownInitialValueState() {
  dropdownValueCategory = "Automobili";
  dropdownValueBrand = "Audi";
  dropdownValueCity = 'Sarajevo';
  buttonOne = false;
  buttonTwo = false;
  buttonThree = false;
}

loginInitControllers() {
  emailInputControllerAlertDialog = new TextEditingController();
  signInRegisterFormKey = GlobalKey<FormState>();
}

// loginDisposeControllers() {
//   signInRegisterFormKey.currentState.dispose();
// }
