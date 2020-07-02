import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/registerForm.dart';

import 'package:flutter/material.dart';

displayDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 239, 232, 232),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: Color.fromRGBO(112, 112, 112, 100),
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
            ),
          ),
          actions: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    //margin: EdgeInsets.only(right: 15.0),
                    child: new FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0)),
                      color: Color.fromARGB(255, 226, 11, 48),
                      child: new Text(
                        'ODUSTANI',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontSize: 14),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ]),
            Container(
              //margin: EdgeInsets.only(right: 25.0),
              child: new FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0)),
                color: Color.fromARGB(255, 226, 11, 48),
                child: new Text(
                  'POŠALJI KOD',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Roboto', fontSize: 14),
                ),
                onPressed: () => Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (_) {
                  return PasswordChange();
                })),
              ),
            ),
          ],
        );
      });
}
