import 'package:Oglasnik/utils/shared/logoContainer.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/welcomeScreen.dart';
import 'package:Oglasnik/view/SignInPage/widgets/FormSignIn.dart';
import 'package:Oglasnik/view/SignInPage/widgets/PrijavaWelcomeScreen.dart';
import 'package:Oglasnik/viewModel/SignIn/SignInViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  final Function toggleView;
  SigninPage({Key key, this.toggleView}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  FirebaseUser user;

  
  bool islogin = false;
  TextEditingController signInEmailInputController;
  TextEditingController signInPasswordInputController;

  @override
  initState() {
    signInEmailInputController = new TextEditingController();
    signInPasswordInputController = new TextEditingController();
    super.initState();
  }

  String error = '';
  @override
  Widget build(BuildContext context) {
    email = signInEmailInputController.text;
    password = signInPasswordInputController.text;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
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
            toggleRegister(context);
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
        onWillPop: () => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) {
          return AnonymouseHome();
        })),
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: Container(
                height: SizeConfig.screenHeight,
                margin: EdgeInsets.all(50),
                child: Column(
                  children: <Widget>[
                    LogoContainer(),
                    WelcomeScreen(),
                    PrijavaWelcomeScreen(),
                    FormSignIn(
                        //signInRegisterFormKey: signInRegisterFormKey,
                        signInEmailInputController: signInEmailInputController,
                        signInPasswordInputController:
                            signInPasswordInputController),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
