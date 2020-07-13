import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/validation.dart';
import 'package:Oglasnik/viewModel/SignIn/SignInViewModel.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/specialElements.dart';
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
    signInRegisterFormKey = GlobalKey<FormState>();
    signInEmailInputController = new TextEditingController();
    signInPasswordInputController = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    signInRegisterFormKey.currentState.dispose();
    signInEmailInputController.dispose();
    signInPasswordInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signInRegisterFormKey,
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
                  controller: widget.signInEmailInputController,
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
                  controller: widget.signInPasswordInputController,
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
                email = widget.signInEmailInputController.text;
                password = widget.signInPasswordInputController.text;
                formKey = signInRegisterFormKey;
                onPressedSignInModel(context, email, password, formKey);
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
    );
  }
}
