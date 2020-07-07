import 'package:Oglasnik/viewModel/SignUp/SignUpViewModel.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/validation.dart';

class FormSignUp extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Form(
      key: signUpRegisterFormKey,
      child: Column(children: <Widget>[
        new Container(
          margin: EdgeInsets.only(top: 15, bottom: 10),
          child: new SizedBox(
            width: double.infinity,
            child: Container(
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'Ime i prezime',
                  contentPadding: EdgeInsets.only(left: 20),
                ),
                controller: signUpFullNameInputController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                //  autofocus: true,
                onFieldSubmitted: (v) {
                  FocusScope.of(context).nextFocus();
                },
                validator: nameValidator,
              ),
            ),
          ),
        ),
        emailInputField(context),
        passwordInputField(context),
        phoneNumberInputField(context),
        registerButton(context),
      ]),
    );
  }
}
