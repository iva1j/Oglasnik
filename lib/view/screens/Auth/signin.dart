import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/screens/Auth/register.dart';
import 'package:Oglasnik/view/screens/RegisterHome/registeredHome.dart';
import 'package:Oglasnik/view/widgets/alertdialog.dart';
import 'package:Oglasnik/view/widgets/logoContainer.dart';
import 'package:Oglasnik/view/widgets/specialElements.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class SigninPage extends StatefulWidget {
  SigninPage({Key key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  FirebaseUser user;

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  TextEditingController emailInputController;
  TextEditingController passwordInputController;

  @override
  initState() {
    emailInputController = new TextEditingController();
    passwordInputController = new TextEditingController();
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

  String passwordValidator(String value) {
    if (value.length == null || value == '')
      return 'Polje ne smije biti prazno';
    if (value.length <= 8) {
      return 'Password ne smije biti manji od 8 char';
    } else {
      return null;
    }
  }

  String error = '';
  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: Container(
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: Colors.white,
              style: BorderStyle.solid,
            ),
          ),
          color: Colors.white,
          onPressed: () => Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) {
            return RegisterPage();
          })),
          child: Text(
            'Registruj se',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
        ),
        height: 60,
        width: double.infinity,
      ),
      body: SingleChildScrollView(
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
          margin: EdgeInsets.only(top: 15.0),
          child: button(
            'Prijavi se',
            () async {
              email = emailInputController.text;
              password = passwordInputController.text;
              formKey = _registerFormKey;

              if (formKey.currentState.validate()) {
                dynamic result = await _auth
                    .signInWithEmailAndPassword(
                        email: email, password: password)
                    .then((value) => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => RegisteredHome())));

                if (result == null) {
                  setState(() => error = 'Email ili lozinka nisu ispravni!');
                } else {}
              }
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15.0),
          child: new GestureDetector(
            onTap: () => displayDialog(context),
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
      margin: EdgeInsets.only(top: 10),
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

  Container welcomeScreen() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    'Dobrodošli u Oglasnik',
                    style: TextStyle(fontSize: 22),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
