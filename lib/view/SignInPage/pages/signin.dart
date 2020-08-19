import 'package:Oglasnik/utils/groupOfFunctions.dart';
import 'package:Oglasnik/utils/shared/PageLogos/mainLogo.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/backButtonsIphone/backButtonIphone.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/welcomeScreen.dart';
import 'package:Oglasnik/view/SignInPage/widgets/FormSignIn.dart';
import 'package:Oglasnik/view/SignInPage/widgets/PrijavaWelcomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/checkingInternet.dart';

class SigninPage extends StatefulWidget {
  final Function toggleView;
  SigninPage({Key key, this.toggleView}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  FirebaseUser user;

  bool islogin = false;

  @override
  initState() {
    cleanSignIn();
    InternetConnectivity().checkForConnectivity();
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  String error = '';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: backButtonIphone(context),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 100.0, right: 100.0, bottom: 5.0),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: Colors.white,
                style: BorderStyle.solid,
              ),
            ),
            color: Colors.white,
            onPressed: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              Navigator.of(context)
                  .pushReplacement(FadeRoute(page: RegisterPage()));
            },
            child: Text(
              RegistrationPageAuthSecondWidget().buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: () {
            Navigator.of(context).pushReplacement(
              FadeRoute(page: AnonymousHome()),
            );
          },
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(bottom: bottom),
              child: Container(
                  margin: EdgeInsets.all(45),
                  child: Column(
                    children: <Widget>[
                      LogoContainer(),
                      WelcomeScreen(),
                      PrijavaWelcomeScreen(),
                      FormSignIn(),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
