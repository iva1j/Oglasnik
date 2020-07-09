import 'package:Oglasnik/viewModel/SignUp/SignUpViewModel.dart';
import 'package:flutter/material.dart';

class FormSignUp extends StatefulWidget {
  const FormSignUp({
    Key key,
    @required GlobalKey<FormState> registerFormKey,
    @required this.signUpFullNameInputController,
    @required this.signUpEmailInputController,
    @required this.signUpPasswordInputController,
    @required this.signUpPhoneNumberInputController,
  })  : signUpRegisterFormKey = registerFormKey,
        super(key: key);

  final GlobalKey<FormState> signUpRegisterFormKey;
  final TextEditingController signUpFullNameInputController;
  final TextEditingController signUpEmailInputController;
  final TextEditingController signUpPasswordInputController;
  final TextEditingController signUpPhoneNumberInputController;

  @override
  _FormSignUpState createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.signUpRegisterFormKey,
      child: Column(children: <Widget>[
        fullNameInputField(context),
        emailInputField(context),
        passwordInputField(context),
        phoneNumberInputField(context),
        registerButton(context),
      ]),
    );
  }
}
