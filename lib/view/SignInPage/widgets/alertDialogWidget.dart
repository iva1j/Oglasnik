import 'package:Oglasnik/utils/colorThemes.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/validation.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertDialogButtons.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';
//dynamic formAlertKey;

class AlertDialogWidget extends StatefulWidget {
  const AlertDialogWidget({
    Key key,
  }) : super(key: key);

  @override
  _AlertDialogWidgetState createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  @override
  void initState() {
    alertFormKey = GlobalKey<FormState>();
    emailInputControllerAlertDialog = new TextEditingController();
    super.initState();
  }

  void dispose() {
    alertFormKey = GlobalKey<FormState>();
    emailInputControllerAlertDialog.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: alertDialogBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: alertDialogBorderColor,
        ),
      ),
      content: Container(
        margin: EdgeInsets.only(top: 43.0),
        child: Form(
          key: alertFormKey,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Email',
              contentPadding: EdgeInsets.only(left: 10),
            ),
            keyboardType: TextInputType.visiblePassword,
            validator: emailAlertDialogValidation,
            controller: emailInputControllerAlertDialog,
          ),
        ),
      ),
      actions: <Widget>[
        Container(
            child: AuthService().allowPasswordChange(
                context, emailInputControllerAlertDialog.text)),
        AlertDialogButtons(),
      ],
    );
  }
}