import 'package:Oglasnik/utils/colorThemes.dart';
import 'package:Oglasnik/utils/validation.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertDialogButtons.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

final GlobalKey<FormState> alertDialogKey = GlobalKey<FormState>();
final TextEditingController emailInputControllerAlertDialog =
    new TextEditingController();
String emailAlertDialog;
String tokenCode = randomAlphaNumeric(5);

displayDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
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
                contentPadding: EdgeInsets.only(left: 10),
              ),
              keyboardType: TextInputType.visiblePassword,
              validator: emailValidator,
              controller: emailInputControllerAlertDialog,
            ),
          ),
          actions: <Widget>[
            AlertDialogButtons(),
          ],
        );
      });
}
