import 'dart:collection';

import 'package:Oglasnik/utils/colorThemes.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';
import 'package:Oglasnik/viewModel/SignIn/SignInViewModel.dart';
import 'package:Oglasnik/viewModel/authViewModel.dart';
import 'package:flutter/material.dart';

class AlertDialogButtons extends StatelessWidget {
  const AlertDialogButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0)),
              color: Color.fromARGB(255, 226, 11, 48),
              child: Text(
                'ODUSTANI',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Roboto', fontSize: 14),
              ),
              onPressed: () {
                alerDialogOnPressedOdustani(context);
              },
            ),
          ),
          Container(
              child: AuthService()
                  .tokenExistOrNot(context, emailAlertDialog, token)),
          Container(
            child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0)),
                color: mainAppColor,
                child: Text(
                  'POŠALJI KOD',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Roboto', fontSize: 14),
                ),
                onPressed: () {
                  onPressedPosaljiKod(context);
                }),
          ),
        ],
      ),
    );
  }
}
