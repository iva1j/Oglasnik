import 'package:Oglasnik/utils/shared/logoContainer.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/validation.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/registerForm.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/welcomeScreen.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';
import 'package:Oglasnik/viewModel/authViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

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
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(gmail|hotmail|yahoo|aol|msn|live|outlook)+(\.com)$|@(hotmail|yahoo)+(\.fr|\.co.uk)$|@(orange)+(\.fr)$';
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
    var idTokenResult = randomAlphaNumeric(5);

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
                    WelcomeScreen(),
                    nameOfForm(),
                    formSignin(email, password, formKey, context, isRegistered),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Form formSignin(String email, String password, formKey, BuildContext context,
      bool isRegistered) {
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
                keyboardType: TextInputType.visiblePassword,
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
          child: AuthService().checkStatus(context, email, password),
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
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (_) => RegisteredHome()));
              }
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15.0),
          child: new GestureDetector(
            onTap: () {
              displayDialog(context);
              formKey.currentState.reset();
            },
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

displayDialog(BuildContext context) async {
  String email = emailInputController.text;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor: Color.fromARGB(255, 239, 232, 232),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: Color.fromRGBO(112, 112, 112, 100),
              ),
            ),
            content: Container(
              margin: EdgeInsets.only(top: 43.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                controller: emailInputController,
                keyboardType: TextInputType.visiblePassword,
                validator: emailValidator,
              ),
            ),
            actions: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      //margin: EdgeInsets.only(right: 15.0),
                      child: new FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0)),
                        color: Color.fromARGB(255, 226, 11, 48),
                        child: new Text(
                          'ODUSTANI',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontSize: 14),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ]),
              Container(
                child: AuthService().tokenChange(context, email),
              ),
              Container(
                  //margin: EdgeInsets.only(right: 25.0),
                  child: new FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0)),
                      color: Color.fromARGB(255, 226, 11, 48),
                      child: new Text(
                        'POŠALJI KOD',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontSize: 14),
                      ),
                      onPressed: () {
                        if (tokenstatus == true) {
                          db
                              .collection("firestoreUsers")
                              .document(email)
                              .setData({
                            'email': email,
                            'token': idTokenResult,
                          });
                          print('korisnik uspješno dodijeljen tokenu');
                          print(idTokenResult);
                        }
                        ;
                      })),
            ]);
      });
}
