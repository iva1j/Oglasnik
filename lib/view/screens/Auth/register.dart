import 'package:Oglasnik/view/screens/Auth/onPressedRegister.dart';
import 'package:Oglasnik/view/screens/RegisterHome/registeredUser.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
    String fullName, email, password, phoneNumber;
    dynamic formKey;
    return Scaffold(
      appBar: AppBar(
        title: Text("Registracija"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
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
          ),
        ),
      ),
    );
  }
}
