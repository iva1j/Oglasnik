import 'package:Oglasnik/utils/groupOfFunctions.dart';
import 'package:Oglasnik/view/PasswordChange/widgets/formPasswordChange.dart';
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
  final db = Firestore.instance;
  FirebaseUser user;
  @override
  void dispose() {
    // passwordChangeDispose();
    super.dispose();
  }

  initState() {
    cleanPasswordChanged();
    // passwordChangeInitControllers();¸
    // passwordInputController.clear();
    // tokenInputController.clear();
    // confirmPasswordInputController.clear();
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
          child: FormPasswordChanged(email: email),
        ),
      ),
    );
  }
}
