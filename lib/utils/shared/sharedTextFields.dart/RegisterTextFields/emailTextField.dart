import 'package:Oglasnik/utils/shared/sharedvalidation/registerValidation/emailRegisterCheckValidator.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.only(left: 20),
      ),
      controller: signUpEmailInputController,
      //keyboardType: TextInputType.emailAddress,
      keyboardType: TextInputType.visiblePassword,
      validator: emailRegisterCheck,
      textInputAction: TextInputAction.next,
      //  focusNode: emailnode,
      onFieldSubmitted: (v) {
        FocusScope.of(context).nextFocus();
      },
    );
  }
}
