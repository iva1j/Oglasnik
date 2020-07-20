import 'package:Oglasnik/utils/shared/sharedvalidation/signInValidation.dart';
import 'package:Oglasnik/view/SignInPage/widgets/FormSignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailSignInTextField extends StatelessWidget {
  const EmailSignInTextField({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final FormSignIn widget;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.only(left: 20),
      ),
      controller: widget.signInEmailInputController,
      keyboardType: TextInputType.visiblePassword,
      validator: emailCheckSignIn,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (v) {
        FocusScope.of(context).nextFocus();
      },
    );
  }
}

class PassSigninTextField extends StatelessWidget {
  const PassSigninTextField({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final FormSignIn widget;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Lozinka',
        contentPadding: EdgeInsets.only(left: 20),
      ),
      controller: widget.signInPasswordInputController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: passwordCheckSignIn,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (v) {
        FocusScope.of(context).nextFocus();
      },
    );
  }
}
