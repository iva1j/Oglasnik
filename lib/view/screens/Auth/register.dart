import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/widgets/onPressedRegister.dart';
import 'package:Oglasnik/view/screens/Auth/signin.dart';
import 'package:Oglasnik/view/widgets/logoContainer.dart';
import 'package:Oglasnik/view/widgets/specialElements.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  TextEditingController fullNameInputController;
  TextEditingController phoneNumberInputController;
  TextEditingController emailInputController;
  TextEditingController passwordInputController;

  @override
  initState() {
    fullNameInputController = new TextEditingController();
    phoneNumberInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    passwordInputController = new TextEditingController();
    super.initState();
  }

  String nameValidator(String value) {
    if (value.length == null || value == '')
      return 'Polje ne smije biti prazno';
    else {
      return null;
    }
  }

  String phoneValidator(String value) {
    if (value.length == 0) {
      return 'Polje ne smije biti prazno';
    }
    return null;
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
    String fullName, email, password, phoneNumber;
    fullName = fullNameInputController.text;
    email = emailInputController.text;
    phoneNumber = phoneNumberInputController.text;
    password = passwordInputController.text;

    dynamic formKey;
    return Scaffold(
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
            return SigninPage();
          })),
          child: Text(
            'Prijavi se',
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
      body: Container(
          height: SizeConfig.screenHeight,
          margin: EdgeInsets.all(50),
          child: Column(
            children: <Widget>[
              LogoContainer(),
              welcomeScreen(),
              nameOfForm(),
              formRegister(
                  fullName, email, password, phoneNumber, formKey, context)
            ],
          )),
    );
  }

  

  Form formRegister(String fullName, String email, String password,
      String phoneNumber, formKey, BuildContext context) {
    return Form(
      key: _registerFormKey,
      child: Column(children: <Widget>[
        new Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: new SizedBox(
            width: double.infinity,
            child: Container(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Ime i prezime',
                  contentPadding: EdgeInsets.only(left: 20),
                ),
                controller: fullNameInputController,
                keyboardType: TextInputType.text,
                validator: nameValidator,
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
               // keyboardType: TextInputType.visiblePassword,
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
                  contentPadding: EdgeInsets.only(left: 20),
                  hintText: 'Broj telefona',
                ),
                controller: phoneNumberInputController,
                keyboardType: TextInputType.phone,
                validator: phoneValidator,
              ),
            ),
          ),
        ),
        button(
          'Registruj se',
          () {
            fullName = fullNameInputController.text;
            email = emailInputController.text;
            password = passwordInputController.text;
            phoneNumber = phoneNumberInputController.text;
            formKey = _registerFormKey;
            onPressedRegister(
                context, fullName, email, password, phoneNumber, formKey);
          },
        ),
      ]),
    );
  }

  Container nameOfForm() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        'Registracija',
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
