import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/validation.dart';
import 'package:Oglasnik/viewModel/SignIn/SignInViewModel.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:flutter/cupertino.dart';

class FormSignIn extends StatefulWidget {
  FormSignIn();

  @override
  _FormSignInState createState() => _FormSignInState();
}

class _FormSignInState extends State<FormSignIn> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: signInLoginFormKey,
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
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        contentPadding: EdgeInsets.only(left: 20),
                      ),
                      controller: signInEmailInputController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: emailCheckSignIn,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).nextFocus();
                      },
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
                        hintText: 'Lozinka',
                        contentPadding: EdgeInsets.only(left: 20),
                      ),
                      controller: signInPasswordInputController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: passwordCheckSignIn,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).nextFocus();
                      },
                    ),
                  ),
                ),
              ),
              Container(
                  child: Column(
                children: <Widget>[
                  Container(
                      //  child: AuthService().tokenExistOrNot(context, email, token),
                      ),
                  Container(
                    child: AuthService().signInOrNot(
                        context,
                        signInEmailInputController.text,
                        signInPasswordInputController.text),
                  ),
                  // Container(child: AuthService().checkStatus(context, email)),
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
                    emailSignIn = signInEmailInputController.text;
                    passwordSignIn = signInPasswordInputController.text;
                    onPressedSignInModel(
                      context,
                      emailSignIn,
                      passwordSignIn,
                    );
                  },
                ),
              ),

              // Container(
              //   margin: EdgeInsets.only(top: 15.0),
              //   child: new GestureDetector(
              //     onTap: () => displayDialog(context),
              //     child: new Text(
              //       "Zaboravili ste lozinku?",
              //       style: TextStyle(
              //           fontFamily: 'Roboto',
              //           fontSize: 16,
              //           color: Color.fromRGBO(0, 0, 0, 100)),
              //     ),
              //   ),
              // )
            ],
          ),
        ));
  }
}
