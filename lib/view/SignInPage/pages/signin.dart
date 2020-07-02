import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:Oglasnik/viewModel/authViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/SignInPage/widgets/signInContainer.dart';

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
    // if (showSignIn) {
    //   return SigninPage(toggleView: toggleView);
    // } else {
    //   return RegisterPage(toggleView: toggleView);
    // }
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 100.0, right: 100.0, bottom: 5.0),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: Colors.white,
              style: BorderStyle.solid,
            ),
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    RegisterPage(),
              ),
            );
            // widget.toggleView();
            //    islogin ? formSignin(email, password, formKey, context) : formRegister(fullNameInputController.text, email, password, phoneNumber, formKey, context);
          },
          child: Text(
            'Registruj se',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
        ),
        // height: 60,
        // width: double.infinity,
      ),
      body: WillPopScope(
        onWillPop: () => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) {
          return AnonymouseHome();
        })),
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: Container(
              height: SizeConfig.screenHeight,
              margin: EdgeInsets.all(50),
              child: SignInContainer(
                  registerFormKey: _registerFormKey,
                  emailInputController: emailInputController,
                  passwordInputController: passwordInputController),
            ),
          ),
        ),
      ),
    );
  }
}
