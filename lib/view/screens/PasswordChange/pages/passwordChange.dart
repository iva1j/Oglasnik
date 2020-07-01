import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/screens/Auth/pages/RegistrationPage/widgets/registerForm.dart';
import 'package:Oglasnik/view/screens/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/view/widgets/specialElements.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/viewModel/authViewModel.dart';

class PasswordChange extends StatefulWidget {
  @override
  _PasswordChangeState createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
  final db = Firestore.instance;
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  FirebaseUser user;
  TextEditingController _email;
  TextEditingController _password;
  TextEditingController _displayName;
  TextEditingController _userID;

  AuthService _auth = AuthService();
  initState() {
    _email = new TextEditingController();
    _displayName = new TextEditingController();
    _userID = new TextEditingController();
    _password = new TextEditingController();
    super.initState();
  }

  String passwordValidator(String value) {
    if (value.length == null || value == '')
      return 'Polje ne smije biti prazno';
    if (value.length <= 7) {
      return 'Password ne smije biti manji od 8 char';
    } else {
      return null;
    }
  }

  String confirmpasswordValidator(String value) {
    if (value.length == null || value == '')
      return 'Polje ne smije biti prazno';
    if (value.length <= 7) {
      return 'Password ne smije biti manji od 8 char';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    dynamic formKey;
    String passwordpravi = _password.text;
    String emailpravi = _email.text;
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
                    key: _registerFormKey,
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
                              controller: _displayName,
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
                                // errorStyle: TextStyle(fontSize: 20),
                                hintText: 'email',
                              ),
                              controller: _email,
                              obscureText: true,
                              validator: passwordValidator,
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
                                hintText: 'Potvrdi šifru',
                              ),
                              controller: _password,
                              obscureText: true,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 110),
                        child: button('Sačuvaj', () {
                          //if (formKey.currentState.validate()) {
                          db
                              .collection("firestoreUsers")
                              .document(emailpravi)
                              .updateData({
                            'password': passwordpravi,
                          });

                          // Navigator.of(context).pushReplacement(
                          //   MaterialPageRoute(
                          //     builder: (_) {
                          //       return RegisteredHome();
                          //     },
                          //   ),
                          // );
                        }
                            //}

                            // AuthService().updateUserinFirestore(
                            //   _displayName.text,
                            //   _email.text,
                            //   _password.text,
                            //);
                            // },
                            ),
                      ),
                    ]),
                  )
                ])),
          ),
        ));
  }
}