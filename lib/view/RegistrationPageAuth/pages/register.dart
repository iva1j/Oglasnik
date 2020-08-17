import 'package:Oglasnik/utils/groupOfFunctions.dart';
import 'package:Oglasnik/utils/shared/PageLogos/mainLogo.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/backButtonsIphone/backButtonIphone.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/registerButton.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/formSignUp.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/signUpFormName.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/welcomeScreen.dart';
import 'package:Oglasnik/view/SignInPage/pages/signin.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/checkingInternet.dart';

class RegisterPage extends StatefulWidget {
  final Function toggleView;
  RegisterPage({Key key, this.toggleView}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  initState() {
    InternetConnectivity().checkForConnectivity();
    cleanRegister();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      SigninPage(),
                ),
              );
            },
            child: Text(
              RegistrationPageAuthPages().prijava,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: () => Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) {
            return AnonymousHome();
          })),
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(bottom: bottom),
              child: Container(

                  // height: SizeConfig.blockSizeVertical * 75,
                  margin: EdgeInsets.all(45),
                  child: Column(
                    children: <Widget>[
                      LogoContainer(),
                      WelcomeScreen(),
                      Container(
                        child:
                            AuthService().checkStatus(context, emailRegister),
                      ),
                      SignUpFormName(),
                      FormSignUp(),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
