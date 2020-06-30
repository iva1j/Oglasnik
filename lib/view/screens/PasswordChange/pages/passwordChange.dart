import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/widgets/specialElements.dart';
import 'package:flutter/material.dart';

class PasswordChange extends StatefulWidget {
  @override
  _PasswordChangeState createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
  String passwordValidator(String value) {
    if (value.length == null || value == '')
      return 'Polje ne smije biti prazno';
    if (value.length <= 7) {
      return 'Password ne smije biti manji od 8 char';
    } else {
      return null;
    }
  }

  String confirmpasswordValidator(String value) {
    if (value.length == null || value == '')
      return 'Polje ne smije biti prazno';
    if (value.length <= 7) {
      return 'Password ne smije biti manji od 8 char';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.black,
                size: 24,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: Container(
                height: SizeConfig.screenHeight,
                margin: EdgeInsets.all(50),
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 120.0),
                    child: Text(
                      "Promijeni šifru",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Form(
                    child: Column(children: <Widget>[
                      new Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: new SizedBox(
                          width: double.infinity,
                          child: Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Unesi kod',
                              ),
                            ),
                          ),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: new SizedBox(
                          width: double.infinity,
                          child: Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                // errorStyle: TextStyle(fontSize: 20),
                                hintText: 'Nova šifra',
                              ),
                              obscureText: true,
                              validator: passwordValidator,
                            ),
                          ),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: new SizedBox(
                          width: double.infinity,
                          child: Container(
                            child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Potvrdi šifru',
                                ),
                                obscureText: true,
                                validator: confirmpasswordValidator),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 110),
                        child: button(
                          'Sačuvaj',
                          () {},
                        ),
                      ),
                    ]),
                  )
                ])),
          ),
        ));
  }
}
