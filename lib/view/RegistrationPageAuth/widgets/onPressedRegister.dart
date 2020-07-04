import 'package:Oglasnik/utils/groupOfFunctions.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/viewModel/authViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatefulWidget {
  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  //bool isRegistered = false;
  final db = Firestore.instance;
  TextEditingController fullNameInputController;
  TextEditingController phoneNumberInputController;
  TextEditingController emailInputController;
  TextEditingController passwordInputController;

  @override
  initState() {
    TextEditingController fullNameInputController = new TextEditingController();
    TextEditingController phoneNumberInputController =
        new TextEditingController();
    TextEditingController emailInputController = new TextEditingController();
    TextEditingController passwordInputController = new TextEditingController();
    //RegisterControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void onPressedRegister(BuildContext context, String fullName, String email,
    String password, String phoneNumber, dynamic formKey) {
  if (formKey.currentState.validate() && status == false) {
    db.collection("firestoreUsers").document(email).setData({
      'fullName': fullName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
    });
    print('korisnik uspješno ubačen u bazi');

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) {
        return RegisteredHome();
      }),
    );
  } else {
    print('korisnik već u bazi, registracija nije uspjela');
  }
}

void onPressedSignIn(
    BuildContext context, String email, String password, dynamic formKey) {
  if (formKey.currentState.validate() && status == true) {
    print('Logged in');

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) {
        return RegisteredHome();
      }),
    );
  } else {
    print('email ili password nisu tacni');
  }
}
