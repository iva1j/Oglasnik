import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/registerTextFields.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/redButton.dart';

import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:flutter/material.dart';

import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/onPressedRegister.dart';

String fullNameRegister, emailRegister, passwordRegister, phoneNumberRegister;
dynamic formKeyRegister;
// final GlobalKey<FormState> signUpRegisterFormKey;
// final TextEditingController signUpFullNameInputController;
// final TextEditingController signUpEmailInputController;
// final TextEditingController signUpPasswordInputController;
// final TextEditingController signUpPhoneNumberInputController;

void cleanInputFields(signUpFullNameInputController, signUpEmailInputController,
    signUpPhoneNumberInputController, signUpPasswordInputController) {
  signUpFullNameInputController.clear();
  signUpEmailInputController.clear();
  signUpPhoneNumberInputController.clear();
  signUpPasswordInputController.clear();
}

Container fullNameInputField(BuildContext context) {
  return new Container(
    margin: EdgeInsets.only(top: 15, bottom: 10),
    child: new SizedBox(
      width: double.infinity,
      child: Container(
        child: NameTextField(),
      ),
    ),
  );
}

SizedBox registerButton(BuildContext context) {
  return button(
    AppLabelsAuth().registracija,
    () {
      allowAutoValidate = true;
      fullNameRegister = signUpFullNameInputController.text;
      emailRegister = signUpEmailInputController.text;
      passwordRegister = signUpPasswordInputController.text;
      phoneNumberRegister = signUpPhoneNumberInputController.text;
      formKeyRegister = signUpRegisterFormKey;
      onPressedRegister(context, fullNameRegister, emailRegister,
          passwordRegister, phoneNumberRegister, formKeyRegister);
    },
  );
}

Container phoneNumberInputField(BuildContext context) {
  return new Container(
    margin: EdgeInsets.only(bottom: 30),
    child: new SizedBox(
      width: double.infinity,
      child: Container(
        child: PhoneTextField(),
      ),
    ),
  );
}

Container passwordInputField(BuildContext context) {
  return new Container(
    margin: EdgeInsets.only(bottom: 10),
    child: new SizedBox(
      width: double.infinity,
      child: Container(
        child: PasswordTextField(),
      ),
    ),
  );
}

Container emailInputField(BuildContext context) {
  return new Container(
    margin: EdgeInsets.only(bottom: 10),
    child: new SizedBox(
      width: double.infinity,
      child: Container(
        child: EmailTextField(),
      ),
    ),
  );
}
