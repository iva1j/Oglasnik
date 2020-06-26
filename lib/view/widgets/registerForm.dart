import 'package:Oglasnik/view/screens/Auth/onPressedRegister.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    Key key,
    @required GlobalKey<FormState> registerFormKey,
    @required this.fullNameInputController,
    @required this.phoneNumberInputController,
    @required this.emailInputController,
    @required this.passwordInputController,
    @required this.fullName,
    @required this.email,
    @required this.password,
    @required this.phoneNumber,
    @required this.formKey,
  }) : _registerFormKey = registerFormKey, super(key: key);

  final GlobalKey<FormState> _registerFormKey;
  final TextEditingController fullNameInputController;
  final TextEditingController phoneNumberInputController;
  final TextEditingController emailInputController;
  final TextEditingController passwordInputController;
  final String fullName;
  final String email;
  final String password;
  final String phoneNumber;
  final dynamic formKey;

  @override
  Widget build(BuildContext context) {
     String fullName, email, password, phoneNumber;
    dynamic formKey;
    return Form(
      key: _registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: fullNameInputController,
          ),
          TextFormField(
            controller: phoneNumberInputController,
            keyboardType: TextInputType.phone,
          ),
          TextFormField(
            controller: emailInputController,
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            controller: passwordInputController,
            obscureText: true,
          ),
          RaisedButton(
            child: Text("Registruj se"),
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: () {
              fullName = fullNameInputController.text;
              email = emailInputController.text;
              password = passwordInputController.text;
              phoneNumber = phoneNumberInputController.text;
              formKey = _registerFormKey;
              onPressedRegister(context, fullName, email, password,
                  phoneNumber, formKey);
            },
          ),
        ],
      ),
    );
  }
}
