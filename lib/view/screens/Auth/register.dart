import 'package:Oglasnik/view/widgets/registerForm.dart';
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
        leading: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: FormWidget(
              registerFormKey: _registerFormKey,
              fullNameInputController: fullNameInputController,
              phoneNumberInputController: phoneNumberInputController,
              emailInputController: emailInputController,
              passwordInputController: passwordInputController,
              fullName: fullName,
              email: email,
              password: password,
              phoneNumber: phoneNumber,
              formKey: formKey),
        ),
      ),
    );
  }
}
