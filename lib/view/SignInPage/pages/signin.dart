import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:Oglasnik/view/SignInPage/widgets/bottomNavigationBar.dart';
import 'package:Oglasnik/viewModel/authViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/SignInPage/widgets/signInContainer.dart';
import 'package:Oglasnik/view/SignInPage/widgets/bodySignIn.dart';


class SigninPage extends StatefulWidget {
  final Function toggleView;
  SigninPage({Key key, this.toggleView}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  FirebaseUser user;

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  bool islogin = false;
  TextEditingController emailInputController;
  TextEditingController passwordInputController;
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  initState() {
    InputFields();

    //AuthService().getRegisteredUsers(db);
    super.initState();
  }
//#TODO checkstatus refactor into viewModel-> authViewModel
  checkStatus(BuildContext context, String email, String password) {
    FutureBuilder(
        future: AuthService().userExistingorNot(email, password),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print(snapshot);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            print('waiting');
          }
          if (snapshot.hasData) {
            print('korisnik zapisan');
            return Container();
          } else {
            print('user  is not existing');
            return null;
          }
        });
  }

  String error = '';
  @override
  Widget build(BuildContext context) {
    String email, password;
    bool isRegistered;
    email = emailInputController.text;
    password = passwordInputController.text;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    dynamic formKey;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: backButtonIphone(context),
      ),
      bottomNavigationBar: 
      BottomBarNavigation(),
      body: BodySignIn(bottom: bottom, registerFormKey: _registerFormKey, emailInputController: emailInputController, passwordInputController: passwordInputController),
    );
  }
}

