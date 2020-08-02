import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';
import 'package:Oglasnik/viewModel/SignIn/SignInViewModel.dart';
import 'package:flutter/material.dart';

class InputFields {
  TextEditingController emailInputController = new TextEditingController();
  TextEditingController passwordInputController = new TextEditingController();
}

class PswChangeFields {
  // TextEditingController _email = new TextEditingController();
  // TextEditingController _displayName = new TextEditingController();
  // TextEditingController _password = new TextEditingController();
}

// class PswCopyFields {
//   TextEditingController _email = new TextEditingController();
//   TextEditingController _name = new TextEditingController();
// }

class RegisterControllers {
  TextEditingController fullNameInputController = new TextEditingController();
  TextEditingController phoneNumberInputController =
      new TextEditingController();
  TextEditingController emailInputController = new TextEditingController();
  TextEditingController passwordInputController = new TextEditingController();
}

registerPageInitControllers() {
  signUpFullNameInputController = new TextEditingController();
  signUpPhoneNumberInputController = new TextEditingController();
  signUpEmailInputController = new TextEditingController();
  signUpPasswordInputController = new TextEditingController();
  signUpRegisterFormKey = GlobalKey<FormState>();
}

registerPageDispose() {
  signUpRegisterFormKey.currentState.dispose();
}

alertDialogInitControllers() {
  alertFormKey = GlobalKey<FormState>();
  emailInputControllerAlertDialog = new TextEditingController();
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
  // passwordChangeFormKey.currentState.dispose();
  //emailInputController.dispose();
  tokenInputController.dispose();
  confirmPasswordInputController.dispose();
}

pageViewInitControllers() {
  productNameController = new TextEditingController();
  productTagController = new TextEditingController();
  productDescController = new TextEditingController();
  productPriceController = new TextEditingController();
}

dropDownInitialValueState() {
  dropdownValueCategory = "Automobili";
  dropdownValueBrand = "Audi";
  dropdownValueCity = 'Sarajevo';
  buttonOne = false;
  buttonTwo = false;
  buttonThree = false;
}

loginInitControllers() {
  signInEmailInputController = new TextEditingController();
  signInPasswordInputController = new TextEditingController();
  signInRegisterFormKey = GlobalKey<FormState>();
}

loginDisposeControllers() {
  signInEmailInputController.dispose();
  signInPasswordInputController.dispose();
  signInRegisterFormKey.currentState.dispose();
}
