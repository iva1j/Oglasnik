import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';
import 'package:Oglasnik/view/SignInPage/widgets/odustaniDugme.dart';
import 'package:Oglasnik/view/SignInPage/widgets/posaljiKodDugme.dart';
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
          OdustaniDugme(),
          Container(
              child: AuthService()
                  .tokenExistOrNot(context, emailAlertDialog, token)),
          PosaljiKodDugme(),
          Container(
              child:
                  AuthService().allowPasswordChange(context, emailAlertDialog))
        ],
      ),
    );
  }
}
