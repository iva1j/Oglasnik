import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/viewModel/SignUp/SignUpViewModel.dart';
import 'package:flutter/material.dart';

class FormSignUp extends StatefulWidget {
  const FormSignUp();

  @override
  _FormSignUpState createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: signUpRegisterFormKey,
        child: Theme(
          data: ThemeData(
            primaryColor: Colors.black54,
            errorColor: Colors.red,
          ),
          child: Column(children: <Widget>[
            fullNameInputField(context),
            emailInputField(context),
            passwordInputField(context),
            phoneNumberInputField(context),
            registerButton(context),
          ]),
        ));
  }
}
