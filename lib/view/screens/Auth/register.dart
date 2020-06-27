import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/widgets/registerForm.dart';
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
            logoContainer(),
            welcomeScreen(),
            nameOfForm(),
            FormWidget(
              registerFormKey: formKey,
              fullNameInputController: null,
              phoneNumberInputController: null,
              emailInputController: null,
              passwordInputController: null,
              fullName: null,
              email: null,
              password: null,
              phoneNumber: null,
              formKey: null,
            )
          ],
        ),
      ),
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

  Container logoContainer() {
    return Container(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.black),
        width: 80,
        height: 77,
      ),
    );
  }
}
