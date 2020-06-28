import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/screens/Auth/onPressedRegister.dart';
import 'package:Oglasnik/view/screens/Auth/register.dart';
import 'package:Oglasnik/view/widgets/logoContainer.dart';
import 'package:Oglasnik/view/widgets/specialElements.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
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

  @override
  Widget build(BuildContext context) {
    String email, password;

    email = emailInputController.text;

    password = passwordInputController.text;

    dynamic formKey;
    return Scaffold(
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
            ),
          ),
        ),
        height: 60,
        width: double.infinity,
      ),
      body: Container(
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
                ),
                controller: passwordInputController,
                keyboardType: TextInputType.text,
                validator: passwordValidator,
              ),
            ),
          ),
        ),
        button(
          'Prijavi se',
          () {},
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: new GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "");
            },
            child: new Text("Zaboravili ste lozinku?"),
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
