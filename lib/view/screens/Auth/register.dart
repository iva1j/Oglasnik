import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/screens/Auth/onPressedRegister.dart';
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
      bottomSheet: Container(
        child: FlatButton(
          color: Colors.white,
          onPressed: () {},
          child: Text(
            'Prijavi se',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        height: 60,
        width: double.infinity,
        color: Color.fromARGB(255, 226, 11, 48),
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
                  labelText: 'Ime i prezime',
                ),
                controller: fullNameInputController,
                keyboardType: TextInputType.text,
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
                  labelText: 'Email',
                ),
                controller: emailInputController,
                keyboardType: TextInputType.emailAddress,
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
                  labelText: 'Lozinka',
                ),
                controller: passwordInputController,
                keyboardType: TextInputType.text,
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
                  labelText: 'Broj telefona',
                ),
                controller: phoneNumberInputController,
                keyboardType: TextInputType.phone,
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
