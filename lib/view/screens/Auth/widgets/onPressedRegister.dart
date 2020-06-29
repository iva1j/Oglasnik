import 'package:Oglasnik/view/screens/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/viewModel/authViewModel.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatefulWidget {
  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  TextEditingController fullNameInputController;
  TextEditingController phoneNumberInputController;
  TextEditingController emailInputController;
  TextEditingController passwordInputController;

  @override
  initState() {
    fullNameInputController = new TextEditingController();
    phoneNumberInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    passwordInputController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void onPressedRegister(BuildContext context, String fullName, String email,
    String password, String phoneNumber, dynamic formKey) {
  if (formKey.currentState.validate()) {
    FormRegisterViewModel()
        .registerWithEmailAndPassword(email, password, fullName, phoneNumber);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) {
        return RegisteredHome();
      }),
    );
  }
}
