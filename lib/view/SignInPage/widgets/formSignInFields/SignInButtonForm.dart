import 'package:Oglasnik/utils/shared/globalVariables.dart';

import 'package:Oglasnik/utils/shared/sharedbuttons/mainAppButtons/redButton.dart';
import 'package:Oglasnik/view/SignInPage/widgets/FormSignIn.dart';

import 'package:Oglasnik/viewModel/SignIn/SignInViewModel.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

String email, password;

class SignInButtonForm extends StatelessWidget {
  const SignInButtonForm({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final FormSignIn widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: button(
        'Prijavi se',
        () async {
          allowAutoValidate = true;
          email = widget.signInEmailInputController.text;
          password = widget.signInPasswordInputController.text;

          onPressedSignInModel(context, email, password);
        },
      ),
    );
  }
}
