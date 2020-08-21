import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/leaveAlertDialogButtons.dart';
import 'package:flutter/material.dart';

AlertDialog leaveAlertDialog(BuildContext context) {
  return new AlertDialog(
    title: Text(
      SuccessAlertDialog().leave,
      style: TextStyle(color: mainAppColor),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                SuccessAlertDialog().leaveopis,
                style: TextStyle(color: alertDialogTextColor),
              ),
              Container(
                margin: Margin().only(3, 0, 0, 0),
                child: Text(
                  SuccessAlertDialog().leaveopis2,
                  style: TextStyle(color: alertDialogTextColor),
                ),
              ),
            ],
          ),
        ),
      ],
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
              child: NapustiButtonDialog(),
            ),
            Container(
              child: OdustaniButtonDialog(),
            ),
          ],
        ),
      )
    ],
  );
}
