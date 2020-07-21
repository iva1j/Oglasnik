import 'package:Oglasnik/utils/shared/sharedvalidation/signinValidation/passwordCheckSignInValidator.dart';
import 'package:Oglasnik/view/SignInPage/widgets/FormSignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
