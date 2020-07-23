import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
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

pageOneDisposeControllers() {
  productNameController.dispose();
  // ignore: invalid_use_of_protected_member
  productNameFormKey.currentState.dispose();
}

pageOneInitControllers() {
  productNameController = new TextEditingController();
}

pageTwoDisposeControllers() {
  // ignore: invalid_use_of_protected_member
  productCategoryDropDownKey.currentState.dispose();
}

pageThreeInitControllers() {
  productTagController = new TextEditingController();
}

pageThreeDisposeControllers() {
  productTagController.dispose();
  // ignore: invalid_use_of_protected_member
  productTagFormKey.currentState.dispose();
}

pageFourInitControllers() {
  productDescController = new TextEditingController();
}

pageFourDisposeControllers() {
  productDescController.dispose();
  // ignore: invalid_use_of_protected_member
  productDescFormKey.currentState.dispose();
}

pageFiveInitControllers() {
  productPriceController = new TextEditingController();
}

pageFiveDisposeControllers() {
  productPriceController.dispose();
  // ignore: invalid_use_of_protected_member
  productPriceFormKey.currentState.dispose();
}

// registerInitControllers() {
//   signUpFullNameInputController = new TextEditingController();

//   signInEmailInputController = new TextEditingController();
//   signUpPhoneNumberInputController = new TextEditingController();
//   signUpEmailInputController = new TextEditingController();
//   signUpPasswordInputController = new TextEditingController();
//   signUpRegisterFormKey = GlobalKey<FormState>();
// }

// registerDisposeControllers() {
//   signUpRegisterFormKey.currentState.dispose();
//   signUpFullNameInputController.dispose();
//   signUpPhoneNumberInputController.dispose();
//   signUpEmailInputController.dispose();
//   signUpPasswordInputController.dispose();
// }

loginInitControllers() {
  signInEmailInputController = new TextEditingController();
  signInPasswordInputController = new TextEditingController();
}

loginDisposeControllers() {
  signInEmailInputController.dispose();
  signInPasswordInputController.dispose();
  signInRegisterFormKey.currentState.dispose();
}
