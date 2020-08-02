import 'package:flutter/material.dart';

class TestInternetDialog extends StatefulWidget {
  @override
  _TestInternetDialogState createState() => _TestInternetDialogState();
}

class _TestInternetDialogState extends State<TestInternetDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //backgroundColor: MyColors().lightBlack,
      backgroundColor: Colors.blue,
      title: Text(
        'Not connected!',
        style: TextStyle(color: Colors.redAccent),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              'Internet veza nije moguća.',
              style: TextStyle(
                  //color: MyColors().lightWhite
                  color: Colors.white),
            ),
            Text(
              'Molimo konektujte se na internet',
              style: TextStyle(
                  // color: MyColors().lightWhite
                  color: Colors.white),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}