import 'package:Oglasnik/view/screens/RegisterHome/registeredUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatefulWidget {
  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
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
    String phoneNumber, String password, dynamic formKey) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
    print('onpressed-button');
    return RegisteredUser();
  }));
  if (formKey.currentState.validate()) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((currentUser) => Firestore.instance
                .collection("Users")
                .document(currentUser.uid)
                .setData({
              "uid": currentUser.uid,
              "fullname": fullName,
              "phone": phoneNumber,
              "email": email,
            }).catchError((err) => print(err)))
        .catchError((err) => print(err));
  }
}
