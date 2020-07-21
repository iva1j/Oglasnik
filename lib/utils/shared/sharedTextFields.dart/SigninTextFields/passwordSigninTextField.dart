import 'package:Oglasnik/utils/shared/sharedvalidation/signinValidation/passwordCheckSignInValidator.dart';
import 'package:Oglasnik/view/SignInPage/widgets/FormSignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PassSigninTextField extends StatelessWidget {
  const PassSigninTextField({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final FormSignIn widget;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        new BlacklistingTextInputFormatter(
          RegExp(
              '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
        ),
      ],
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
