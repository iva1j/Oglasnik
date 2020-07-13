import 'dart:async';
import 'package:Oglasnik/utils/colorThemes.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/validation.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

TextEditingController emailInputController = new TextEditingController();
TextEditingController tokenInputController = new TextEditingController();
TextEditingController passwordInputController = new TextEditingController();
TextEditingController confirmPasswordInputController =
    new TextEditingController();
String token, newPassword, confirmPassword, passwordConfirm;
bool doesMatch = false;

// ignore: must_be_immutable
class PasswordChange extends StatefulWidget {
  String email;
  PasswordChange(this.email);
  @override
  _PasswordChangeState createState() => _PasswordChangeState(email);
}

class _PasswordChangeState extends State<PasswordChange> {
  //final GlobalKey<FormState> _passwordChangeFormKey = GlobalKey<FormState>();
  final db = Firestore.instance;
  FirebaseUser user;
  @override
  void dispose() {
    // passwordChangeFormKey.currentState.dispose();
    //emailInputController.dispose();
    tokenInputController.dispose();
    confirmPasswordInputController.dispose();
    super.dispose();
  }

  initState() {
    emailInputController = new TextEditingController();
    tokenInputController = new TextEditingController();
    confirmPasswordInputController = new TextEditingController();
    passwordChangeFormKey = GlobalKey<FormState>();
    super.initState();
  }

  String email;
  _PasswordChangeState(this.email);
  @override
  Widget build(BuildContext context) {
    // dynamic formKey;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.black,
              size: 24,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(bottom: bottom),
          child: Container(
            height: SizeConfig.screenHeight,
            margin: EdgeInsets.all(50),
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 120.0),
                child: Text(
                  "Promijeni šifru",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal),
                ),
              ),
              Form(
                //autovalidate: true,
                key: passwordChangeFormKey,
                child: Column(children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: new SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (v) {
                            FocusScope.of(context).nextFocus();
                          },
                          decoration: InputDecoration(
                            hintText: 'Unesi kod',
                            contentPadding: EdgeInsets.only(left: 10),
                          ),
                          controller: tokenInputController,
                          validator: tokenValidator,
                        ),
                      ),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: new SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (v) {
                            FocusScope.of(context).nextFocus();
                          },
                          decoration: InputDecoration(
                            hintText: 'Nova lozinka',
                            contentPadding: EdgeInsets.only(left: 10),
                          ),
                          obscureText: true,
                          validator: passwordValidator,
                          controller: passwordInputController,
                          // validator: (value) => value.isEmpty
                          //     ? 'Polje ne može biti prazno!'
                          //     : null,
                          // onSaved: (value) => newPassword = value,
                        ),
                      ),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: new SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (v) {
                            FocusScope.of(context).unfocus();
                          },
                          style: TextStyle(
                              // color: (nepoklapanje == true)
                              //     ? Colors.red
                              //     : Colors.black,
                              color: doesMatch ? Colors.red : Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Potvrdi lozinku',
                            contentPadding: EdgeInsets.only(left: 10),
                          ),
                          obscureText: true,
                          controller: confirmPasswordInputController,
                          validator: confirmpasswordValidator,
                          // validator: (value) {
                          //   if (value != passwordInputController.text) {
                          //     return 'Lozinke se ne podudaraju!';
                          //   }
                          // }
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: AuthService().tokenExistOrNot(context, email, token),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 110),
                    child: button('Sačuvaj', () {
                      newPassword = passwordInputController.text;
                      passwordConfirm = confirmPasswordInputController.text;
                      token = tokenInputController.text;
                      print('Nakon klika - ispis je sljedeći:');
                      AuthService().onPressedChangePassword(
                        context,
                        email,
                        passwordInputController.text,
                        confirmPasswordInputController.text,
                        token,
                      );
                    }),
                  ),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
