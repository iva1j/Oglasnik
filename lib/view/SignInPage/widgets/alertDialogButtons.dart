import 'package:Oglasnik/utils/colorThemes.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';
import 'package:Oglasnik/viewModel/SignIn/SignInViewModel.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:flutter/material.dart';

class AlertDialogButtons extends StatefulWidget {
  const AlertDialogButtons({
    Key key,
  }) : super(key: key);

  @override
  _AlertDialogButtonsState createState() => _AlertDialogButtonsState();
}

class _AlertDialogButtonsState extends State<AlertDialogButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
              child:
                  AuthService().allowPasswordChange(context, emailAlertDialog))
        ],
      ),
    );
  }
}
