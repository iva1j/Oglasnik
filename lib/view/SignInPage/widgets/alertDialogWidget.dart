import 'package:Oglasnik/utils/colorThemes.dart';
import 'package:Oglasnik/utils/validation.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertDialogButtons.dart';
import 'package:Oglasnik/viewModel/authViewModel.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';

class AlertDialogWidget extends StatefulWidget {
  const AlertDialogWidget({
    Key key,
  }) : super(key: key);

  @override
  _AlertDialogWidgetState createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: alertDialogKey,
      backgroundColor: alertDialogBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: alertDialogBorderColor,
        ),
      ),
      content: Container(
        margin: EdgeInsets.only(top: 43.0),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'Email',
          ),
          keyboardType: TextInputType.visiblePassword,
          validator: emailValidator,
          controller: emailInputControllerAlertDialog,
        ),
      ),
      actions: <Widget>[
        Container(
          child: AuthService()
              .checkStatus(context, emailInputControllerAlertDialog.text),
        ),
        AlertDialogButtons(),
      ],
    );
  }
}
