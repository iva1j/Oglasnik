import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/validation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  initState() {
    _email = new TextEditingController();
    _displayName = new TextEditingController();

    _password = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
