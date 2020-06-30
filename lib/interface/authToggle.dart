import 'package:flutter/material.dart';
import 'package:Oglasnik/view/screens/Auth/pages/RegistrationPage/register.dart';
import 'package:Oglasnik/view/screens/Auth/pages/SignInPage/signin.dart';

class Toggle extends StatefulWidget {
  @override
  _ToggleState createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SigninPage(toggleView: toggleView);
    } else {
      return RegisterPage(toggleView: toggleView);
    }
  }
}
