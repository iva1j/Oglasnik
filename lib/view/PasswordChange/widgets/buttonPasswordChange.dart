import 'package:Oglasnik/utils/shared/sharedbuttons/mainAppButtons/redButton.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:flutter/material.dart';

class ButtonSacuvaj extends StatelessWidget {
  const ButtonSacuvaj({
    Key key,
    @required this.email,
  }) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 110),
      child: button('Sačuvaj', () {
        newPassword = passwordInputController.text;
        passwordConfirm = confirmPasswordInputController.text;
        token = tokenInputController.text;
        print('Nakon klika - ispis je sljedeći:');
        AuthService().onPressedChangePassword(
          context,
          email,
          passwordInputController.text,
          confirmPasswordInputController.text,
          token,
        );
      }),
    );
  }
}
