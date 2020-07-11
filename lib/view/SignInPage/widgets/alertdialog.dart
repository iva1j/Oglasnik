import 'package:Oglasnik/view/SignInPage/widgets/alertDialogWidget.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'alertDialogWidget.dart';

TextEditingController emailInputControllerAlertDialog =
    new TextEditingController();
String emailAlertDialog;
String tokenCode = randomAlphaNumeric(5);

displayDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialogWidget();
    },
  );
}
