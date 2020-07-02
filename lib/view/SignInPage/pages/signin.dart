import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/utils/logoContainer.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/welcomeScreen.dart';
import 'package:Oglasnik/viewModel/authViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    emailInputController = new TextEditingController();
    passwordInputController = new TextEditingController();
    //AuthService().getRegisteredUsers(db);
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^((\s?[^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}\s?\s?))$';
    RegExp regex = new RegExp(pattern);
    if (value.length == null || value == '')
      return 'Polje ne smije biti prazno';
    if (!regex.hasMatch(value)) {
      return 'Email mora biti validan';
    } else {
      return null;
    }
  }

  checkStatus(BuildContext context, String email, String password) {
    FutureBuilder(
        future: AuthService().userExistingorNot(email, password),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print('korisnik zapisan');
            isLogin = true;
            return Container();
          } else {
            print('user  is not existing');
            return null;
          }
        });
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

  String error = '';
  @override
  Widget build(BuildContext context) {
    // if (showSignIn) {
    //   return SigninPage(toggleView: toggleView);
    // } else {
    //   return RegisterPage(toggleView: toggleView);
    // }
    String email, password;

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
                child: Column(
                  children: <Widget>[
                    LogoContainer(),
                    welcomeScreen(),
                    nameOfForm(),
                    formSignin(email, password, formKey, context)
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Form formSignin(
      String email, String password, formKey, BuildContext context) {
    return Form(
      key: _registerFormKey,
      child: Column(children: <Widget>[
        new Container(
          margin: EdgeInsets.only(bottom: 10),
          child: new SizedBox(
            width: double.infinity,
            child: Container(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  contentPadding: EdgeInsets.only(left: 20),
                ),
                controller: emailInputController,
                keyboardType: TextInputType.emailAddress,
                validator: emailValidator,
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
                  hintText: 'Lozinka',
                  contentPadding: EdgeInsets.only(left: 20),
                ),
                controller: passwordInputController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: passwordValidator,
              ),
            ),
          ),
        ),
        Container(

            //child: AuthService().checkStatus(context, email, password),
            //child: AuthService().checkStatus(context, email, password),
            ),
        Container(
          margin: EdgeInsets.only(top: 20.0),
          child: button(
            'Prijavi se',
            () async {
              email = emailInputController.text;
              password = passwordInputController.text;
              formKey = _registerFormKey;

              if (formKey.currentState.validate()) {
                checkStatus(context, email, password);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => RegisteredHome()));
              }
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15.0),
          child: new GestureDetector(
            // onTap: () => displayDialog(context),
            child: new Text(
              "Zaboravili ste lozinku?",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: Color.fromRGBO(0, 0, 0, 102)),
            ),
          ),
        )
      ]),
    );
  }

  Container nameOfForm() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10.0),
      alignment: Alignment.centerLeft,
      child: Text(
        'Prijava',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),
    );
  }
}
