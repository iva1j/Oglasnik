import 'package:Oglasnik/utils/globals.dart';
import 'package:Oglasnik/utils/groupOfFunctions.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/SigninTextFields/emailSigninTextField.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/SigninTextFields/passwordSigninTextField.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/mainAppButtons/redButton.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:Oglasnik/viewModel/SignIn/SignInViewModel.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:flutter/cupertino.dart';

String email, password;
dynamic formKey;

// ignore: must_be_immutable
class FormSignIn extends StatefulWidget {
  FormSignIn({
    Key key,
    @required this.signInEmailInputController,
    @required this.signInPasswordInputController,
  }) : super(key: key);

  TextEditingController signInEmailInputController;
  TextEditingController signInPasswordInputController;

  @override
  _FormSignInState createState() => _FormSignInState();
}

class _FormSignInState extends State<FormSignIn> {
  @override
  void initState() {
    loginInitControllers();
    // InternetConnection();
    //  InternetConnection().checkForInternet();
    super.initState();
  }

  @override
  void dispose() {
    loginDisposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: signInRegisterFormKey,
        child: Theme(
          data: ThemeData(
            primaryColor: Colors.black54,
            errorColor: Colors.red,
          ),
          child: Column(
            children: <Widget>[
              new Container(
                margin: EdgeInsets.only(bottom: 10),
                child: new SizedBox(
                  width: double.infinity,
                  child: Container(
                    child: EmailSignInTextField(widget: widget),
                  ),
                ),
              ),
              new Container(
                margin: EdgeInsets.only(bottom: 10),
                child: new SizedBox(
                  width: double.infinity,
                  child: Container(
                    child: PassSigninTextField(widget: widget),
                  ),
                ),
              ),
              Container(
                  child: Column(
                children: <Widget>[
                  Container(
                    child: AuthService().tokenExistOrNot(context, email, token),
                  ),
                  Container(
                    child: AuthService().signInOrNot(
                        context,
                        signInEmailInputController.text,
                        signInPasswordInputController.text),
                  ),
                  Container(child: AuthService().checkStatus(context, email)),
                  Container(
                      child: AuthService().allowPasswordChange(
                          context, emailInputControllerAlertDialog.text))
                ],
              )),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: button(
                  'Prijavi se',
                  () async {
                    allowAutoValidate = true;
                    email = widget.signInEmailInputController.text;
                    password = widget.signInPasswordInputController.text;
                    formKey = signInRegisterFormKey;
                    onPressedSignInModel(context, email, password, formKey);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: new GestureDetector(
                  onTap: () => displayDialog(context),
                  child: new Text(
                    "Zaboravili ste lozinku?",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: Color.fromRGBO(0, 0, 0, 100)),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
