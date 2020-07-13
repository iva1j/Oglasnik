import 'package:Oglasnik/utils/colorThemes.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/successDialogButtons.dart';
import 'package:flutter/material.dart';

AlertDialog successAlertDialog(BuildContext context) {
  return new AlertDialog(
    title: Text(
      SuccessAlertDialog().odlicno,
      style: TextStyle(color: mainAppColor),
    ),
    content: Container(
      height: 120,
      child: Column(
        children: [
          Text(
            SuccessAlertDialog().opis1,
            style: TextStyle(color: alertDialogTextColor),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              SuccessAlertDialog().opis2,
              style: TextStyle(color: alertDialogTextColor),
            ),
          ),
        ],
      ),
    ),
    backgroundColor: successDialogBgColor,
    elevation: 10,
    actions: <Widget>[
      Container(
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: KreirajButtonDialog(),
            ),
            Container(
              child: UreduButtonDialog(),
            ),
          ],
        ),
      )
    ],
  );
}
