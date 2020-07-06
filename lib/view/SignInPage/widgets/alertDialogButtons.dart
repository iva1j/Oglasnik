import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';
import 'package:Oglasnik/viewModel/authViewModel.dart';
import 'package:flutter/material.dart';

class AlertDialogButtons extends StatelessWidget {
  const AlertDialogButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0)),
              color: Color.fromARGB(255, 226, 11, 48),
              child: Text(
                'ODUSTANI',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 14),
              ),
              onPressed: () {
                Navigator.of(context).pop();
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
                color: Color.fromARGB(255, 226, 11, 48),
                child: Text(
                  'POŠALJI KOD',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 14),
                ),
                onPressed: () {
                  emailAlertDialog =
                      emailInputControllerAlertDialog.text;
                  AuthService().onPressedAlertDialog(
                      context, emailAlertDialog, tokenCode);
                }),
          ),
        ]);
  }
}
