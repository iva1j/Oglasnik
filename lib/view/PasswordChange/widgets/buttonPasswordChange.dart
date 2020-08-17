import 'dart:async';

import 'package:Oglasnik/utils/shared/globalVariables.dart';
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
        newPassword = newPasswordChanged;
        passwordConfirm = confirmPasswordChanged;
        token = passwordChangedToken;
        AuthService().tokenExistOrNot(context, email, token);

        print('Nakon klika sačuvaj - ispis je sljedeći:');

        Timer(Duration(milliseconds: 500), () {
          AuthService().onPressedChangePassword(
            context,
            email,
            newPasswordChanged,
            confirmPasswordChanged,
            token,
          );
        });
      }),
    );
  }
}
