import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:flutter/cupertino.dart';

class Authentication extends StatelessWidget {
  const Authentication({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: AuthService().tokenExistOrNot(context, email, token),
          ),
          Container(
            child:
                AuthService().signInOrNot(context, signInEmail, signInPassword),
          ),
          Container(child: AuthService().checkStatus(context, email)),
          // Container(
          //   child: AuthService().allowPasswordChange(
          //       context, emailInputControllerAlertDialog.text),
          // )
        ],
      ),
    );
  }
}
