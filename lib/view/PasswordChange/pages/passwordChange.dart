import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/validation.dart';
import 'package:Oglasnik/viewModel/authViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final GlobalKey<FormState> passwordChangeFormKey = GlobalKey<FormState>();
final TextEditingController emailInputController = new TextEditingController();
final TextEditingController tokenInputController = new TextEditingController();
final TextEditingController passwordInputController =
    new TextEditingController();
final TextEditingController confirmPasswordInputController =
    new TextEditingController();
String token, password, confirmPassword, passwordConfirm;

// ignore: must_be_immutable
class PasswordChange extends StatefulWidget {
  String email;

  PasswordChange(this.email);

  @override
  _PasswordChangeState createState() => _PasswordChangeState(email);
}

class _PasswordChangeState extends State<PasswordChange> {
  final db = Firestore.instance;
  FirebaseUser user;
  initState() {
    // PswChangeFields();
    super.initState();
  }

  String email;
  _PasswordChangeState(this.email);

  @override
  Widget build(BuildContext context) {
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
                    key: passwordChangeFormKey,
                    child: Column(children: <Widget>[
                      new Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: new SizedBox(
                          width: double.infinity,
                          child: Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Unesi kod',
                              ),
                              controller: tokenInputController,
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
                              decoration: InputDecoration(
                                hintText: 'Nova lozinka',
                              ),
                              obscureText: true,
                              validator: passwordValidator,
                              controller: passwordInputController,
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
                              decoration: InputDecoration(
                                hintText: 'Potvrdi lozinku',
                              ),
                              obscureText: true,
                              controller: confirmPasswordInputController,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: AuthService()
                            .tokenExistOrNot(context, email, token),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 110),
                        child: button('Sačuvaj', () {
                          //  email = emailInputController.text;
                          password = passwordInputController.text;
                          passwordConfirm = confirmPasswordInputController.text;
                          token = tokenInputController.text;
                          print('Nakon klika - ispis je sljedeći:');
                          AuthService().onPressedChangePassword(
                              email, password, passwordConfirm, token);
                        }),
                      ),
                    ]),
                  )
                ])),
          ),
        ));
  }
}
