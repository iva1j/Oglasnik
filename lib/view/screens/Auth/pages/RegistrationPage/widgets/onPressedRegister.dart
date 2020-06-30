import 'package:Oglasnik/view/screens/PasswordChange/pages/passwordChange.dart';
import 'package:Oglasnik/view/screens/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/viewModel/authViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatefulWidget {
  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  final db = Firestore.instance;
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
    // FormRegisterViewModel()
    //     .registerWithEmailAndPassword(email, password, fullName, phoneNumber);

    //registerWithEmailAndPassword(fullName, email, password);

    //AuthService().registerWithEmailAndPassword(fullName, email, password);
    db.collection("firestoreUsers").document(email).setData({
      'fullName': fullName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber
      });
    
    

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) {
        return PasswordChange();
      }),
    );
  }
}
