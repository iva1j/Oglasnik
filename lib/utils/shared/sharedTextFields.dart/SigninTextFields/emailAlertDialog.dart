import 'package:Oglasnik/utils/shared/sharedvalidation/signinValidation/emailAlertDialogValidator.dart';
import 'package:Oglasnik/viewModel/SignIn/SignInViewModel.dart';
import 'package:flutter/material.dart';

class EmailAlertDialog extends StatelessWidget {
  const EmailAlertDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.only(left: 10),
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: emailAlertDialogValidation,
      controller: emailInputControllerAlertDialog,
    );
  }
}
