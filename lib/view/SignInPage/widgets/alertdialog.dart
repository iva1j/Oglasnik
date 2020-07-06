import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/validation.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/viewModel/authViewModel.dart';
import 'package:random_string/random_string.dart';
import 'package:mailgun/mailgun.dart';

var mailgun = MailgunMailer(
    domain: "sandbox1ea206ede0f448c4a2bc5328e3eb28f3.mailgun.org",
    apiKey: "181a12651b6077cace838e5fff2d360f-913a5827-cb8d41fb");

final GlobalKey<FormState> alertDialogKey = GlobalKey<FormState>();
final TextEditingController emailInputController = new TextEditingController();
String tokenCode = randomAlphaNumeric(5);
Future<void> sendemail() async {
  var response = await mailgun.send(
      from: 'faruk.cidic@gmail.com',
      to: ['faruk.cidic@gmail.com'],
      subject: "Zaboravili ste lozinku? ",
      text: "Token za resetovanje lozinke je: " + tokenCode);
  print(response);
}

//best case for checking user
  Future<bool> userExistingorNot(String email) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('firestoreUsers')
        .where('email', isEqualTo: email)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    print("documents - Alert Dialog = " + documents.length.toString());
    documents.length.toString() == '1' ? status = true : status = false;
    print('status email-a unešenog na AlerDialogu: ' + status.toString());
    return documents.length == 1;
  }

  checkStatus(BuildContext context, String email) {
    FutureBuilder(
        future: AuthService().userExistingorNot(email),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print('korisnik postoji');
            return Container();
          } else {
            print('korisnik nije u bazi');
            return Container();
          }
        });
  }

displayDialog(BuildContext context) async {
  String email;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          key: alertDialogKey,
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
              controller: emailInputController,
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
                        emailInputController.clear();
                      },
                    ),
                  ),
                  Container(
                      child:
                          AuthService().tokenExistOrNot(context, email, token)),
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
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontSize: 14),
                  ),
                  onPressed: () {
                    //#TODO
// 1. Napraviti validaciju koja NE DOZVOLJAVA prolaz ukoliko email nije u bazi (AuthService().userExistingorNot -> metoda koja to provjerava; pogledati rezultat vraćanja metode, kako bi ispravno validaciju podesili)
// 2. email validacija nije implementirana (gmail.con može proći)
                    email = emailInputController.text;
                    AuthService()
                        .onPressedAlertDialog(context, email, tokenCode);
                        emailInputController.clear();
                  }
                  ),
            ),
          ],
        );
      });
}
