import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/mainAppButtons/redButton.dart';
import 'package:flutter/material.dart';

class TestInternetDialog extends StatefulWidget {
  @override
  _TestInternetDialogState createState() => _TestInternetDialogState();
}

class _TestInternetDialogState extends State<TestInternetDialog> {
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
      title: Container(
          child: Text(
        'Opcija nije moguća! \n',
      )),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              'Povezivanje na internet nije moguće.',
            ),
            Text(
              'Molimo povežite se na internet',
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: button('OK', () {
                  Navigator.of(context).pop();
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
