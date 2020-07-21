import 'package:Oglasnik/utils/shared/sharedvalidation/tokenandpassValidation/passValidator.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelStyle: TextStyle(),
        hintText: 'Lozinka',
        contentPadding: EdgeInsets.only(left: 20),
      ),
      controller: signUpPasswordInputController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      textInputAction: TextInputAction.next,
      //  focusNode: lozinkanode,
      onFieldSubmitted: (v) {
        FocusScope.of(context).nextFocus();
      },

      validator: passwordValidator,
    );
  }
}
