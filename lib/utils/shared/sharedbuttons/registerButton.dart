import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/mainAppButtons/redButton.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/onPressedRegister.dart';

String fullNameRegister, emailRegister, passwordRegister, phoneNumberRegister;

void cleanInputFields(signUpFullNameInputController, signUpEmailInputController,
    signUpPhoneNumberInputController, signUpPasswordInputController) {
  signUpFullNameInputController.clear();
  signUpEmailInputController.clear();
  signUpPhoneNumberInputController.clear();
  signUpPasswordInputController.clear();
}

SizedBox registerButton(BuildContext context) {
  return button(
    AppLabelsAuth().registracija,
    () {
      allowAutoValidate = true;

      onPressedRegister(context, fullNameRegister, emailRegister,
          passwordRegister, phoneNumberRegister);
    },
  );
}
