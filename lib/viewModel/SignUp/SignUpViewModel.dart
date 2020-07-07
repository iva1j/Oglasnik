import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/validation.dart';
import 'package:Oglasnik/utils/specialElements.dart';
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

SizedBox registerButton(BuildContext context) {
  return button(
    AppLabelsAuth().registracija,
    () {
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
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20),
            hintText: 'Broj telefona',
          ),
          controller: signUpPhoneNumberInputController,
          keyboardType: TextInputType.phone,
          validator: phoneValidator,
          textInputAction: TextInputAction.done,
          // focusNode: phonenode,
          onFieldSubmitted: (v) {
            FocusScope.of(context).unfocus();
            //  _calculator();
          },
        ),
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
        child: TextFormField(
          decoration: InputDecoration(
            labelStyle: TextStyle(),
            hintText: 'Lozinka',
            contentPadding: EdgeInsets.only(left: 20),
          ),
          controller: signUpPasswordInputController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          textInputAction: TextInputAction.next,
          //  focusNode: lozinkanode,
          onFieldSubmitted: (v) {
            FocusScope.of(context).nextFocus();
          },

          validator: passwordValidator,
        ),
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
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'Email',
            contentPadding: EdgeInsets.only(left: 20),
          ),
          controller: signUpEmailInputController,
          //keyboardType: TextInputType.emailAddress,
          keyboardType: TextInputType.visiblePassword,
          validator: emailRegisterCheck,
          textInputAction: TextInputAction.next,
          //  focusNode: emailnode,
          onFieldSubmitted: (v) {
            FocusScope.of(context).nextFocus();
          },
        ),
      ),
    ),
  );
}
